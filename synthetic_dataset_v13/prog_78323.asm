; DESCRIPTION: Places a orange line segment connecting (17, 101) to (172, 36).
; PLAN: r0=17(x1), r1=101(y1), r2=172(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 101
LDI r2, 172
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
