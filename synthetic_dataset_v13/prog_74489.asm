; DESCRIPTION: Draws a orange line from (325, 118) to (232, 58).
; PLAN: r0=325(x1), r1=118(y1), r2=232(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 118
LDI r2, 232
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
