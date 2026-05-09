; DESCRIPTION: Renders a white disk with center (165, 83) and radius 73.
; PLAN: r0=165(x), r1=83(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 83
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
