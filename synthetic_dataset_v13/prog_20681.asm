; DESCRIPTION: Renders a white disk with center (407, 45) and radius 29.
; PLAN: r0=407(x), r1=45(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 45
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
