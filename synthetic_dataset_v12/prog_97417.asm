; DESCRIPTION: Places a orange line segment connecting (314, 19) to (444, 170).
; PLAN: r0=314(x1), r1=19(y1), r2=444(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 19
LDI r2, 444
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
