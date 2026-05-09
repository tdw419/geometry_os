; DESCRIPTION: Places a orange line segment connecting (232, 87) to (448, 147).
; PLAN: r0=232(x1), r1=87(y1), r2=448(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 87
LDI r2, 448
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
