; DESCRIPTION: Places a orange line segment connecting (456, 49) to (476, 112).
; PLAN: r0=456(x1), r1=49(y1), r2=476(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 49
LDI r2, 476
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
