; DESCRIPTION: Renders a purple disk with center (198, 155) and radius 76.
; PLAN: r0=198(x), r1=155(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 155
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
