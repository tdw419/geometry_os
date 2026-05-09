; DESCRIPTION: Renders a black disk with center (51, 174) and radius 14.
; PLAN: r0=51(x), r1=174(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 174
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
