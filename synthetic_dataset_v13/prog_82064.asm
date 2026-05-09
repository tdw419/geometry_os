; DESCRIPTION: Renders a blue disk with center (435, 198) and radius 58.
; PLAN: r0=435(x), r1=198(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 198
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
