; DESCRIPTION: Renders a white disk with center (310, 164) and radius 73.
; PLAN: r0=310(x), r1=164(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 164
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
