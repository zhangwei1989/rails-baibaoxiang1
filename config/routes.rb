Rails.application.routes.draw do

  devise_for :users
  get "/faq" => "pages#faq"

  resources :events
  resource :user

  namespace :admin do
    root "events#index"
    resources :events do
      resources :tickets, :controller => "event_tickets"
    end
    resources :users do
      resource :profile, :controller => "user_profiles"
    end
  end

  root "events#index"

end
