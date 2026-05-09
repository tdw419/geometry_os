; DESCRIPTION: Places a orange line segment connecting (376, 165) to (58, 116).
; PLAN: r0=376(x1), r1=165(y1), r2=58(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 165
LDI r2, 58
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
