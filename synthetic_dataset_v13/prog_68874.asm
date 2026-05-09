; DESCRIPTION: Renders a blue disk with center (442, 54) and radius 47.
; PLAN: r0=442(x), r1=54(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 54
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
