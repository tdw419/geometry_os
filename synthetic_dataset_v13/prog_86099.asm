; DESCRIPTION: Renders a purple disk with center (397, 158) and radius 62.
; PLAN: r0=397(x), r1=158(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 158
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
