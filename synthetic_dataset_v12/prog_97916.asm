; DESCRIPTION: Renders a purple disk with center (282, 190) and radius 62.
; PLAN: r0=282(x), r1=190(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 190
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
