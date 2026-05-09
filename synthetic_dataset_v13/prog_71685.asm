; DESCRIPTION: Renders a black disk with center (421, 109) and radius 74.
; PLAN: r0=421(x), r1=109(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 109
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
