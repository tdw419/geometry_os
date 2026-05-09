; DESCRIPTION: Places a orange line segment connecting (138, 123) to (341, 157).
; PLAN: r0=138(x1), r1=123(y1), r2=341(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 123
LDI r2, 341
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
