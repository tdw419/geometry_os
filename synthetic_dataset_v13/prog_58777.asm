; DESCRIPTION: Renders a blue disk with center (390, 147) and radius 35.
; PLAN: r0=390(x), r1=147(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 147
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
