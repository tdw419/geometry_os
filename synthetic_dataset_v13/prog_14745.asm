; DESCRIPTION: Places a orange line segment connecting (476, 18) to (433, 116).
; PLAN: r0=476(x1), r1=18(y1), r2=433(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 18
LDI r2, 433
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
