; DESCRIPTION: Renders a blue disk with center (183, 136) and radius 56.
; PLAN: r0=183(x), r1=136(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 136
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
