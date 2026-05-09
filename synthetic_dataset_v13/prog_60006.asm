; DESCRIPTION: Places a orange line segment connecting (310, 132) to (476, 124).
; PLAN: r0=310(x1), r1=132(y1), r2=476(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 132
LDI r2, 476
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
