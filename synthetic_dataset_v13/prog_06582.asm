; DESCRIPTION: Places a black line segment connecting (432, 4) to (158, 78).
; PLAN: r0=432(x1), r1=4(y1), r2=158(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 4
LDI r2, 158
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
