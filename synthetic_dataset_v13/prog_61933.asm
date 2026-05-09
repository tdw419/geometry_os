; DESCRIPTION: Renders a white disk with center (372, 176) and radius 66.
; PLAN: r0=372(x), r1=176(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 176
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
