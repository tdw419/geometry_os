; DESCRIPTION: Places a red line segment connecting (476, 105) to (13, 139).
; PLAN: r0=476(x1), r1=105(y1), r2=13(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 105
LDI r2, 13
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
