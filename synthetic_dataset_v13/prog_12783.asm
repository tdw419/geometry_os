; DESCRIPTION: Places a orange line segment connecting (314, 145) to (427, 166).
; PLAN: r0=314(x1), r1=145(y1), r2=427(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 145
LDI r2, 427
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
