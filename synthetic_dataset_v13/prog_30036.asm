; DESCRIPTION: Renders a white disk with center (383, 78) and radius 62.
; PLAN: r0=383(x), r1=78(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 78
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
