; DESCRIPTION: Places a orange line segment connecting (274, 102) to (67, 78).
; PLAN: r0=274(x1), r1=102(y1), r2=67(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 102
LDI r2, 67
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
