; DESCRIPTION: Renders a white disk with center (227, 97) and radius 66.
; PLAN: r0=227(x), r1=97(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 97
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
