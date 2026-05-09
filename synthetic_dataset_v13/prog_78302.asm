; DESCRIPTION: Renders a white disk with center (250, 66) and radius 49.
; PLAN: r0=250(x), r1=66(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 66
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
