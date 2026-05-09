; DESCRIPTION: Places a orange line segment connecting (158, 187) to (229, 232).
; PLAN: r0=158(x1), r1=187(y1), r2=229(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 187
LDI r2, 229
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
