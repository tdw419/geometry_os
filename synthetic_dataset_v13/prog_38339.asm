; DESCRIPTION: Renders a white disk with center (138, 119) and radius 17.
; PLAN: r0=138(x), r1=119(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 119
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
