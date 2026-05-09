; DESCRIPTION: Renders a blue disk with center (390, 78) and radius 29.
; PLAN: r0=390(x), r1=78(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 78
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
