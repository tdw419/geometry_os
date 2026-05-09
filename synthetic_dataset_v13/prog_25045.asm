; DESCRIPTION: Places a orange line segment connecting (383, 156) to (318, 191).
; PLAN: r0=383(x1), r1=156(y1), r2=318(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 156
LDI r2, 318
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
