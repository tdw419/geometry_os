; DESCRIPTION: Renders a white disk with center (191, 119) and radius 58.
; PLAN: r0=191(x), r1=119(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 119
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
