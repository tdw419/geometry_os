; DESCRIPTION: Renders a blue disk with center (314, 192) and radius 48.
; PLAN: r0=314(x), r1=192(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 192
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
