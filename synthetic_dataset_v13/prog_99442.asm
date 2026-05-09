; DESCRIPTION: Renders a blue disk with center (76, 192) and radius 58.
; PLAN: r0=76(x), r1=192(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 192
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
