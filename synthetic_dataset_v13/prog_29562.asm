; DESCRIPTION: Renders a purple disk with center (351, 155) and radius 79.
; PLAN: r0=351(x), r1=155(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 155
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
