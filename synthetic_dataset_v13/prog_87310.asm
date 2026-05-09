; DESCRIPTION: Renders a white disk with center (157, 132) and radius 37.
; PLAN: r0=157(x), r1=132(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 132
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
