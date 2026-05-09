; DESCRIPTION: Renders a white disk with center (421, 81) and radius 18.
; PLAN: r0=421(x), r1=81(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 81
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
