; DESCRIPTION: Places a orange line segment connecting (194, 158) to (40, 159).
; PLAN: r0=194(x1), r1=158(y1), r2=40(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 158
LDI r2, 40
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
