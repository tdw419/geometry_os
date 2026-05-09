; DESCRIPTION: Renders a purple disk with center (427, 88) and radius 38.
; PLAN: r0=427(x), r1=88(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 88
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
