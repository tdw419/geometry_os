; DESCRIPTION: Renders a magenta disk with center (353, 136) and radius 20.
; PLAN: r0=353(x), r1=136(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 136
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
