; DESCRIPTION: Renders a black disk with center (358, 148) and radius 17.
; PLAN: r0=358(x), r1=148(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 148
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
