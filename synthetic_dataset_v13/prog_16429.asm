; DESCRIPTION: Renders a purple disk with center (151, 224) and radius 26.
; PLAN: r0=151(x), r1=224(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 224
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
