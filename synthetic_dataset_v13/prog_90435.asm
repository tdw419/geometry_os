; DESCRIPTION: Renders a black disk with center (334, 170) and radius 76.
; PLAN: r0=334(x), r1=170(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 170
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
