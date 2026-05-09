; DESCRIPTION: Renders a blue disk with center (287, 88) and radius 28.
; PLAN: r0=287(x), r1=88(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 88
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
