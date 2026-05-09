; DESCRIPTION: Places a orange line segment connecting (484, 26) to (274, 49).
; PLAN: r0=484(x1), r1=26(y1), r2=274(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 26
LDI r2, 274
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
