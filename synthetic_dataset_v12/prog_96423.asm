; DESCRIPTION: Creates a purple circular shape at (339, 203) with radius 15.
; PLAN: r0=339(x), r1=203(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 203
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
