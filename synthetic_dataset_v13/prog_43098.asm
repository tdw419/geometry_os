; DESCRIPTION: Places a orange line segment connecting (477, 101) to (182, 129).
; PLAN: r0=477(x1), r1=101(y1), r2=182(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 101
LDI r2, 182
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
