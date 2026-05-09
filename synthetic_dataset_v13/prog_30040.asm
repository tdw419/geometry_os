; DESCRIPTION: Renders a blue disk with center (155, 196) and radius 25.
; PLAN: r0=155(x), r1=196(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 196
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
