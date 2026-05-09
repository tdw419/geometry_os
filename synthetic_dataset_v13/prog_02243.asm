; DESCRIPTION: Renders a blue disk with center (105, 83) and radius 47.
; PLAN: r0=105(x), r1=83(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 83
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
