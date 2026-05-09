; DESCRIPTION: Places a orange line segment connecting (153, 246) to (376, 20).
; PLAN: r0=153(x1), r1=246(y1), r2=376(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 246
LDI r2, 376
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
