; DESCRIPTION: Renders a blue disk with center (107, 155) and radius 72.
; PLAN: r0=107(x), r1=155(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 155
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
