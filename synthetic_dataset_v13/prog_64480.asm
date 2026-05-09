; DESCRIPTION: Renders a white disk with center (274, 45) and radius 21.
; PLAN: r0=274(x), r1=45(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 45
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
