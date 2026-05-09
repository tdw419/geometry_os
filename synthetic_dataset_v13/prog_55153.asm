; DESCRIPTION: Renders a purple disk with center (482, 88) and radius 17.
; PLAN: r0=482(x), r1=88(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 88
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
