; DESCRIPTION: Renders a white disk with center (139, 45) and radius 43.
; PLAN: r0=139(x), r1=45(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 45
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
