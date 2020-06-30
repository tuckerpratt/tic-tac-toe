class Board


    

    def initialize()
        @squares = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

        @won = false
    end

    @@wins = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
    [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
    [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
    ]


    def display()
        puts @squares[0..2].join(" | ")
        puts @squares[3..5].join(" | ")
        puts @squares[6..8].join(" | ")
    end

    def o_choice()
        if @won == false
            puts "What square, player o? \n[1, 2, 3] \n[4, 5, 6] \n[7, 8, 9]"
            choice = gets.chomp.to_i
            if @squares[choice - 1] == " "
                @squares[choice - 1] = "o"
                display()
                check_lines()
            else
                puts "Please choose a valid square"
                o_choice
            end
        end
    end

    def x_choice()
        if @won == false
            puts "What square, player x? \n[1, 2, 3] \n[4, 5, 6] \n[7, 8, 9]"
            choice = gets.chomp.to_i
            if @squares[choice - 1] == " "
                @squares[choice - 1] = "x"
                display()
                check_lines()
            else
                puts "Please choose a valid square"
                x_choice
            end
        end
    end
    
    def check_lines
        if @@wins.any? { |line| line.all? { |square| @squares[square] == "x" } }
            puts "PLAYER X WINS!"
            @won = true
        end

        if @@wins.any? { |line| line.all? { |square| @squares[square] == "o" } }
            puts "PLAYER O WINS!"
            @won = true
        end

        if @squares.all? { |square| square != " " }  and @won == false
            puts "IT'S A TIE!"
            @won = true
        end
        return @won
      end

    def play_game()
        while @won == false
            o_choice
            x_choice
        end
    end
end

game = Board.new()


game.play_game
