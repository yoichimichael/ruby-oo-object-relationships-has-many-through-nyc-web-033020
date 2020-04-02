class Waiter
 
  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end

        # similar to what we've 
        # done with customer, but
        # different parameters/arguments
  def new_meal(customer, total, tip=0) #<= different parameters than w/ customerirb
    Meal.new(self, customer, total, tip)  #<= same syntax as w/ customer
  end
 
  def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
   
    best_tipped_meal.customer
  end 

  def most_frequent_customer
    customer_visits = Hash.new(0)
    #array of all customer visits including same customers
    customers = meals.map { |meal| meal.customer }
    customers.map { |name| customer_visits[name] += 1 }
    customer_visits.max_by{|k,v| v}    
  end

end