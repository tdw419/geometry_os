; DESCRIPTION: Renders a blue disk with center (155, 119) and radius 48.
; PLAN: r0=155(x), r1=119(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 119
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
