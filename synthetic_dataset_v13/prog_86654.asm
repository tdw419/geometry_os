; DESCRIPTION: Places a white circle of radius 76 at center (399, 78).
; PLAN: r0=399(x), r1=78(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 78
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
