; DESCRIPTION: Places a orange line segment connecting (477, 194) to (476, 101).
; PLAN: r0=477(x1), r1=194(y1), r2=476(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 194
LDI r2, 476
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
