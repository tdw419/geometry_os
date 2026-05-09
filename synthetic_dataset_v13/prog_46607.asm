; DESCRIPTION: Draws a orange line from (451, 120) to (106, 245).
; PLAN: r0=451(x1), r1=120(y1), r2=106(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 120
LDI r2, 106
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
