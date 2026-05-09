; DESCRIPTION: Places a orange line segment connecting (376, 246) to (375, 173).
; PLAN: r0=376(x1), r1=246(y1), r2=375(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 246
LDI r2, 375
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
