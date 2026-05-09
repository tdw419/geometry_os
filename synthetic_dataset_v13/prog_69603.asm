; DESCRIPTION: Renders a black disk with center (418, 78) and radius 69.
; PLAN: r0=418(x), r1=78(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 78
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
