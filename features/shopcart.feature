Feature: The shopcart service back-end
    As a User
    I need a Shopcart service
    So that I can keep track of all my products in the shopcart

Background:
    Given the following shopcarts
        | user_id | product_id | name | quantity | price | time       |
        | 1       | 3          | pen  | 1        | 2     | 2019-11-18 |
        | 1       | 4          | food | 2        | 4     | 2019-11-18 |
        | 1       | 5          | water| 3        | 6     | 2019-11-18 |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Shopcart RESTful Service" in the title
    And I should not see "404 Not Found"

Scenario: Create a Shopcart
    When I visit the "Home Page"
    And I press the "Clear" button
    And I set the "User ID" to "2"
    And I press the "Create Shopcart" button
    Then I should see the message "Create shopcart successfully"
    When I press the "Read this" button
    Then I should see the message "No items in current shopcart"

Scenario: Create a Product
    When I visit the "Home Page"
    And I press the "Clear" button
    And I set the "User ID" to "1"
    And I set the "Product ID" to "6"
    And I set the "Name" to "test"
    And I set the "Quantity" to "2"
    And I set the "Price" to "5"
    And I set the "Time" to "11-29-2022"
    And I press the "Create" button
    Then I should see the message "Record has been created"
    When I press the "Read this" button
    Then I should see the message "Success"
    And I should see "pen" in the results
    And I should see "food" in the results
    And I should not see "pig" in the results
    And I should see "test" in the results
    When I press the "Clear" button
    And I set the "User ID" to "1"
    And I set the "Product ID" to "6"
    And I press the "Retrieve record" button
    Then I should see the message "Success"
    And I should see "test" in the results

Scenario: List all shopcarts
    When I visit the "Home Page"
    And I press the "List" button
    Then I should see the message "Success"
    And I should see "pen" in the results
    And I should see "food" in the results
    And I should not see "pig" in the results
