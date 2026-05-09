; DESCRIPTION: Renders a blue disk with center (227, 81) and radius 60.
; PLAN: r0=227(x), r1=81(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 81
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
