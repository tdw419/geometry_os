; DESCRIPTION: Renders a black disk with center (62, 225) and radius 18.
; PLAN: r0=62(x), r1=225(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 225
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
