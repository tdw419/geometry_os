; DESCRIPTION: Renders a purple disk with center (371, 71) and radius 62.
; PLAN: r0=371(x), r1=71(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 71
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
