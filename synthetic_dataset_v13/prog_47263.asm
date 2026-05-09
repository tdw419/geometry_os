; DESCRIPTION: Renders a purple disk with center (396, 237) and radius 11.
; PLAN: r0=396(x), r1=237(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 237
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
