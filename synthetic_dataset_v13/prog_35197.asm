; DESCRIPTION: Renders a purple disk with center (261, 136) and radius 38.
; PLAN: r0=261(x), r1=136(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 136
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
