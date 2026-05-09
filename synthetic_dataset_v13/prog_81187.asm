; DESCRIPTION: Renders a black disk with center (155, 189) and radius 39.
; PLAN: r0=155(x), r1=189(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 189
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
