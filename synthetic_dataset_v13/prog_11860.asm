; DESCRIPTION: Renders a blue disk with center (391, 136) and radius 26.
; PLAN: r0=391(x), r1=136(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 136
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
