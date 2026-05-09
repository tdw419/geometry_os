; DESCRIPTION: Renders a purple disk with center (210, 198) and radius 35.
; PLAN: r0=210(x), r1=198(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 198
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
