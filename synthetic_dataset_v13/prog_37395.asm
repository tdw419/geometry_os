; DESCRIPTION: Places a orange line segment connecting (310, 96) to (376, 35).
; PLAN: r0=310(x1), r1=96(y1), r2=376(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 96
LDI r2, 376
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
