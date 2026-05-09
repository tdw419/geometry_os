; DESCRIPTION: Renders a white disk with center (478, 44) and radius 15.
; PLAN: r0=478(x), r1=44(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 44
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
