; DESCRIPTION: Places a orange line segment connecting (158, 137) to (54, 15).
; PLAN: r0=158(x1), r1=137(y1), r2=54(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 137
LDI r2, 54
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
