; DESCRIPTION: Renders a blue disk with center (364, 83) and radius 37.
; PLAN: r0=364(x), r1=83(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 83
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
