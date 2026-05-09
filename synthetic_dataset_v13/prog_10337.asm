; DESCRIPTION: Places a orange line segment connecting (241, 139) to (153, 77).
; PLAN: r0=241(x1), r1=139(y1), r2=153(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 139
LDI r2, 153
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
