; DESCRIPTION: Places a orange line segment connecting (388, 139) to (28, 105).
; PLAN: r0=388(x1), r1=139(y1), r2=28(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 139
LDI r2, 28
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
