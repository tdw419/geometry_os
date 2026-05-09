; DESCRIPTION: Renders a orange line between points (87, 65) and (121, 35).
; PLAN: r0=87(x1), r1=65(y1), r2=121(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 65
LDI r2, 121
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
