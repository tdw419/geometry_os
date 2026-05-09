; DESCRIPTION: Places a orange line segment connecting (148, 246) to (318, 104).
; PLAN: r0=148(x1), r1=246(y1), r2=318(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 246
LDI r2, 318
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
