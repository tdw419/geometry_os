; DESCRIPTION: Places a orange circle of radius 38 at center (62, 78).
; PLAN: r0=62(x), r1=78(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 78
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
