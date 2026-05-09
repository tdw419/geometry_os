; DESCRIPTION: Renders a purple disk with center (220, 88) and radius 62.
; PLAN: r0=220(x), r1=88(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 88
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
