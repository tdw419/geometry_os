; DESCRIPTION: Renders a blue disk with center (313, 136) and radius 58.
; PLAN: r0=313(x), r1=136(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 136
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
