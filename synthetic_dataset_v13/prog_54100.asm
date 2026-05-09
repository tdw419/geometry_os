; DESCRIPTION: Renders a purple disk with center (142, 224) and radius 18.
; PLAN: r0=142(x), r1=224(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 224
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
