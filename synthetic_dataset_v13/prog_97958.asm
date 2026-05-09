; DESCRIPTION: Renders a white disk with center (183, 84) and radius 18.
; PLAN: r0=183(x), r1=84(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 84
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
