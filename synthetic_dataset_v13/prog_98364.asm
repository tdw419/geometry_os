; DESCRIPTION: Renders a white disk with center (100, 136) and radius 51.
; PLAN: r0=100(x), r1=136(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 136
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
