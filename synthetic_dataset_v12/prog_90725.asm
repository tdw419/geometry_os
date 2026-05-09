; DESCRIPTION: Places a orange circle of radius 73 at center (314, 106).
; PLAN: r0=314(x), r1=106(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 106
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
