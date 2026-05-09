; DESCRIPTION: Renders a white disk with center (254, 136) and radius 43.
; PLAN: r0=254(x), r1=136(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 136
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
