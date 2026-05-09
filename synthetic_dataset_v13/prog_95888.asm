; DESCRIPTION: Renders a black disk with center (253, 111) and radius 51.
; PLAN: r0=253(x), r1=111(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 111
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
