; DESCRIPTION: Renders a purple disk with center (232, 88) and radius 69.
; PLAN: r0=232(x), r1=88(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 88
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
