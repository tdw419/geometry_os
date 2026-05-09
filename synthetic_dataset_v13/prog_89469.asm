; DESCRIPTION: Places a orange line segment connecting (131, 172) to (315, 245).
; PLAN: r0=131(x1), r1=172(y1), r2=315(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 172
LDI r2, 315
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
