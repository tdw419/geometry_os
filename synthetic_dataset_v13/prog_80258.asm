; DESCRIPTION: Renders a white disk with center (125, 136) and radius 20.
; PLAN: r0=125(x), r1=136(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 136
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
