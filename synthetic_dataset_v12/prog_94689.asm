; DESCRIPTION: Draws a purple circle centered at (351, 158) with radius 67.
; PLAN: r0=351(x), r1=158(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 158
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
