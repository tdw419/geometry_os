; DESCRIPTION: Draws a orange line from (390, 211) to (390, 145).
; PLAN: r0=390(x1), r1=211(y1), r2=390(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 211
LDI r2, 390
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
