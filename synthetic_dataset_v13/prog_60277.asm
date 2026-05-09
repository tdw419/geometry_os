; DESCRIPTION: Places a orange line segment connecting (3, 14) to (102, 204).
; PLAN: r0=3(x1), r1=14(y1), r2=102(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 14
LDI r2, 102
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
