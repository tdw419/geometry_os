; DESCRIPTION: Places a orange line segment connecting (355, 105) to (381, 74).
; PLAN: r0=355(x1), r1=105(y1), r2=381(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 105
LDI r2, 381
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
