; DESCRIPTION: Renders a black disk with center (51, 105) and radius 39.
; PLAN: r0=51(x), r1=105(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 105
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
