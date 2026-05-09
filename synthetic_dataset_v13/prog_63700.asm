; DESCRIPTION: Renders a white disk with center (372, 45) and radius 45.
; PLAN: r0=372(x), r1=45(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 45
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
