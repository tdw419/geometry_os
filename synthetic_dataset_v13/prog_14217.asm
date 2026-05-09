; DESCRIPTION: Places a orange line segment connecting (78, 167) to (432, 36).
; PLAN: r0=78(x1), r1=167(y1), r2=432(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 167
LDI r2, 432
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
