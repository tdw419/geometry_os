; DESCRIPTION: Places a orange circle of radius 24 at center (238, 123).
; PLAN: r0=238(x), r1=123(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 123
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
