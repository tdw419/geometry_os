; DESCRIPTION: Renders a white disk with center (417, 114) and radius 76.
; PLAN: r0=417(x), r1=114(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 114
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
