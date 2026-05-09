; DESCRIPTION: Places a orange line segment connecting (204, 87) to (376, 165).
; PLAN: r0=204(x1), r1=87(y1), r2=376(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 87
LDI r2, 376
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
