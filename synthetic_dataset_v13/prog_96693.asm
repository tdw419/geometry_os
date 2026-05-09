; DESCRIPTION: Draws a orange line from (359, 21) to (390, 200).
; PLAN: r0=359(x1), r1=21(y1), r2=390(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 21
LDI r2, 390
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
