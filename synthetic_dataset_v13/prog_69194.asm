; DESCRIPTION: Places a orange circle of radius 38 at center (78, 129).
; PLAN: r0=78(x), r1=129(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 129
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
