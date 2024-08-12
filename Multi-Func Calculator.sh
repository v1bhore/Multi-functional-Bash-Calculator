#1/usr/bin

function function1 {

echo "Enter Two numbers : "
read a
read b

echo "Enter Choice :"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

read ch

case $ch in
  1)res=`echo $a + $b | bc`
  ;;
  2)res=`echo $a - $b | bc`
  ;;
  3)res=`echo $a \* $b | bc`
  ;;
  4)res=`echo "scale=2; $a / $b" | bc`
  ;;
esac
echo "Result : $res"
}

function function2 {

echo "Enter a number:"
read num1

echo "Enter an operator (Sin, Cos, Tan, Log, Sqrt):"
echo "1. Sin:"
echo "2. Cos:"
echo "3. Tan:"
echo "4. Log:"
echo "5. Sqrt:"
read operator

case $operator in
  "1") result=$(echo "s($num1)" | bc -l) ;;
  "2") result=$(echo "c($num1)" | bc -l) ;;
  "3") result=$(echo "s($num1)/c($num1)" | bc -l) ;;
  "4") result=$(echo "l($num1)/l(10)" | bc -l) ;;
  "5") result=$(echo "sqrt($num1)" | bc -l) ;;
  *) echo "Invalid operator"
     exit 1
     ;;
esac

echo "Result: $result"
}

function function3
{

echo "Enter the amount you want to convert:"
read amount

echo "Enter the source currency (USD, EUR, GBP, INR):"
echo "1. USD:"
echo "2. EUR:"
echo "3. GBP:"
echo "4. INR:"
read source_currency

echo "Enter the target currency (USD, EUR, GBP, INR):"
echo "1. USD:"
echo "2. EUR:"
echo "3. GBP:"
echo "4. INR:"

read target_currency

case $source_currency in
  "1")
    case $target_currency in
      "2") rate=0.84 ;;
      "3") rate=0.76 ;;
      "4") rate=73.62 ;;
      *) echo "Invalid target currency"
         exit 1
         ;;
    esac
    ;;
  "2")
    case $target_currency in
      "1") rate=1.19 ;;
      "3") rate=0.89 ;;
      "4") rate=87.76 ;;
      *) echo "Invalid target currency"
         exit 1
         ;;
    esac
    ;;
  "3")
    case $target_currency in
      "1") rate=1.31 ;;
      "2") rate=1.12 ;;
      "4") rate=100.96 ;;
      *) echo "Invalid target currency"
         exit 1
         ;;
    esac
    ;;
  "4")
    case $target_currency in
      "1") rate=0.012 ;;
      "2") rate=0.011 ;;
      "3") rate=0.010 ;;
      *) echo "Invalid target currency"
         exit 1
         ;;
    esac
    ;;
  *) echo "Invalid source currency"
     exit 1
     ;;
esac

result=$(echo "$amount * $rate" | bc)
echo "$amount (source_currency) = $result (target_currency)"

}
function function4 {
#!/bin/bash

echo "Enter the temperature you want to convert:"
read temperature

echo "Enter the source unit (Celsius, Fahrenheit, Kelvin):"
echo "1. Celsius"
echo "2. Fahrenheit"
echo "3. Kelvin"
read source_unit

echo "Enter the target unit (Celsius, Fahrenheit, Kelvin):"
echo "1. Celius"
echo "2. Fahrenheit"
echo "3. Kelvin"
read target_unit

# Conversion formulas
case $source_unit in
  "1")
    case $target_unit in
      "2") result=$(echo "($temperature * 9/5) + 32" | bc) ;;
      "3") result=$(echo "$temperature + 273.15" | bc) ;;
      *) result=$temperature ;;
    esac
    ;;
  "2")
    case $target_unit in
      "1") result=$(echo "($temperature - 32) * 5/9" | bc) ;;
      "3") result=$(echo "($temperature - 32) * 5/9 + 273.15" | bc) ;;
      *) result=$temperature ;;
    esac
    ;;
  "3")
    case $target_unit in
      "1") result=$(echo "$temperature - 273.15" | bc) ;;
      "2") result=$(echo "($temperature - 273.15) * 9/5 + 32" | bc) ;;
      *) result=$temperature ;;
    esac
    ;;
  *) echo "Invalid source unit"
     exit 1
     ;;
esac

echo "$temperature (source unit) = $result (target unit)"

}

function function5
{

echo "Enter a length in meters: "
read length_in_meters

echo "Enter the unit you want to convert to (mm, cm, ft, in): "
echo "1. mm:"
echo "2. cm:"
echo "3. ft:"
echo "4. in:"

read unit_to

if [ $unit_to = "1" ]; then
  length_in_mm=$(echo "$length_in_meters * 1000" | bc)
  echo "$length_in_meters meters is equal to $length_in_mm millimeters"
elif [ $unit_to = "2" ]; then
  length_in_cm=$(echo "$length_in_meters * 100" | bc)
  echo "$length_in_meters meters is equal to $length_in_cm centimeters"
elif [ $unit_to = "3" ]; then
  length_in_ft=$(echo "$length_in_meters * 3.28084" | bc)
  echo "$length_in_meters meters is equal to $length_in_ft feet"
elif [ $unit_to = "4" ]; then
  length_in_in=$(echo "$length_in_meters * 39.3701" | bc)
  echo "$length_in_meters meters is equal to $length_in_in inches"
else
  echo "Invalid unit entered"
fi

}

function function6
{
echo "Enter the value to be converted: "
read value
echo "Enter the unit to convert from (W, kW, MW): "
echo "1. W:"
echo "2. kW:"
echo "3. MW:"
read from_unit
echo "Enter the unit to convert to (W, kW, MW): "
echo "1. W:"
echo "2. kW:"
echo "3. MW:"
read to_unit

if [ "$from_unit" = "1" ]
then
    if [ "$to_unit" = "2" ]
    then
        result=$(echo "$value / 1000" | bc -l)
        echo "$value W = $result kW"
    elif [ "$to_unit" = "3" ]
    then
        result=$(echo "$value / 1000000" | bc -l)
        echo "$value W = $result MW"
    else
        echo "Invalid conversion unit"
    fi
elif [ "$from_unit" = "2" ]
then
    if [ "$to_unit" = "1" ]
    then
        result=$(echo "$value * 1000" | bc -l)
        echo "$value kW = $result W"
    elif [ "$to_unit" = "3" ]
    then
        result=$(echo "$value / 1000" | bc -l)
        echo "$value kW = $result MW"
    else
        echo "Invalid conversion unit"
    fi
elif [ "$from_unit" = "3" ]
then
    if [ "$to_unit" = "1" ]
    then
        result=$(echo "$value * 1000000" | bc -l)
        echo "$value MW = $result W"
    elif [ "$to_unit" = "2" ]
    then
        result=$(echo "$value * 1000" | bc -l)
        echo "$value MW = $result kW"
    else
        echo "Invalid conversion unit"
    fi
else
    echo "Invalid input unit"
fi

}

function function7
{
echo "Enter the value to be converted: "
read value
echo "Enter the unit to convert from (Pa, kPa, MPa): "
echo "1) Pa:"
echo "2) kPa:"
echo "3) MPa"
read from_unit
echo "Enter the unit to convert to (Pa, kPa, MPa): "
echo "1) Pa:"
echo "2) kPa"
echo "3) MpA"
read to_unit

if [ "$from_unit" = "1" ]
then
    if [ "$to_unit" = "2" ]
    then
        result=$(echo "$value / 1000" | bc -l)
        echo "$value Pa = $result kPa"
    elif [ "$to_unit" = "3" ]
    then
        result=$(echo "$value / 1000000" | bc -l)
        echo "$value Pa = $result MPa"
    else
        echo "Invalid conversion unit"
    fi
elif [ "$from_unit" = "2" ]
then
    if [ "$to_unit" = "1" ]
    then
        result=$(echo "$value * 1000" | bc -l)
        echo "$value kPa = $result Pa"
    elif [ "$to_unit" = "3" ]
    then
        result=$(echo "$value / 1000" | bc -l)
        echo "$value kPa = $result MPa"
    else
        echo "Invalid conversion unit"
    fi
elif [ "$from_unit" = "3" ]
then
    if [ "$to_unit" = "1" ]
    then
        result=$(echo "$value * 1000000" | bc -l)
        echo "$value MPa = $result Pa"
    elif [ "$to_unit" = "2" ]
    then
        result=$(echo "$value * 1000" | bc -l)
        echo "$value MPa = $result kPa"
    else
        echo "Invalid conversion unit"
    fi
else
    echo "Invalid input unit"
fi

}

function function8
{

echo "Enter the value of speed: "
read speed
echo "Enter the unit of speed (m/s, km/h, mph): "
echo "1. m/s:"
echo "2. km/h:"
echo "3. mph:"
read unit

if [ "$unit" = "1" ]; then
  echo "$speed m/s = $(echo "$speed * 3.6" | bc) km/h"
  echo "$speed m/s = $(echo "$speed * 2.236936" | bc) mph"
elif [ "$unit" = "2" ]; then
  echo "$speed km/h = $(echo "$speed / 3.6" | bc) m/s"
  echo "$speed km/h = $(echo "$speed / 1.60934" | bc) mph"
elif [ "$unit" = "3" ]; then
  echo "$speed mph = $(echo "$speed * 1.60934 * 3.6" | bc) km/h"
  echo "$speed mph = $(echo "$speed * 1.60934" | bc) m/s"
else
  echo "Invalid unit"
fi
}

function function9
{
echo "Enter the value of weight: "
read weight
echo "Enter the unit of weight (g, kg, lb, oz): "
echo "1. g:"
echo "2. kg:"
echo "3. lb:"
echo "4. oz:"
read unit

if [ "$unit" = "1" ]; then
  echo "$weight g = $(echo "$weight * 0.001" | bc) kg"
  echo "$weight g = $(echo "$weight * 0.00220462" | bc) lb"
  echo "$weight g = $(echo "$weight * 0.035274" | bc) oz"
elif [ "$unit" = "2" ]; then
  echo "$weight kg = $(echo "$weight * 1000" | bc) g"
  echo "$weight kg = $(echo "$weight * 2.20462" | bc) lb"
  echo "$weight kg = $(echo "$weight * 35.274" | bc) oz"
elif [ "$unit" = "3" ]; then
  echo "$weight lb = $(echo "$weight * 453.592" | bc) g"
  echo "$weight lb = $(echo "$weight * 0.453592" | bc) kg"
  echo "$weight lb = $(echo "$weight * 16" | bc) oz"
elif [ "$unit" = "4" ]; then
  echo "$weight oz = $(echo "$weight * 28.3495" | bc) g"
  echo "$weight oz = $(echo "$weight * 0.0283495" | bc) kg"
  echo "$weight oz = $(echo "$weight / 16" | bc) lb"
else
  echo "Invalid unit"
fi

}


echo "Choose amongst the following:"
echo " "
echo "1. Calculator:"
echo "2. Scientific Calculator:"
echo " "
echo "      Conversions - "
echo " "
echo "3. Conversion of Currencies:"
echo "4. Temprature Conversion:"
echo "5. Length Conversion"
echo "6. Power Conversion"
echo "7. Pressure Conversion"
echo "8. Speed Conversion"
echo "9. Weight Conversion"

read num

case $num in
  1) function1 ;;
  2) function2 ;;
  3) function3 ;;
  4) function4 ;;
  5) function5 ;;
  6) function6 ;;
  7) function7 ;;
  8) function8 ;;
  9) function9 ;;

  *) echo "Invalid Choice" ;;
esac