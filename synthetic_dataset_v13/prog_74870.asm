; DESCRIPTION: Places a orange line segment connecting (68, 155) to (307, 147).
; PLAN: r0=68(x1), r1=155(y1), r2=307(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 155
LDI r2, 307
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
