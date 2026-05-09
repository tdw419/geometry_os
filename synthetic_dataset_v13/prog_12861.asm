; DESCRIPTION: Places a orange line segment connecting (86, 147) to (183, 87).
; PLAN: r0=86(x1), r1=147(y1), r2=183(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 147
LDI r2, 183
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
