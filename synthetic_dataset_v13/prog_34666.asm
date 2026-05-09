; DESCRIPTION: Renders a white disk with center (114, 188) and radius 22.
; PLAN: r0=114(x), r1=188(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 188
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
