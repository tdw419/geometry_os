; DESCRIPTION: Renders a purple disk with center (137, 230) and radius 15.
; PLAN: r0=137(x), r1=230(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 230
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
