; DESCRIPTION: Creates a purple circular shape at (353, 203) with radius 48.
; PLAN: r0=353(x), r1=203(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 203
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
