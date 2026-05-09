; DESCRIPTION: Draws a purple circle centered at (67, 237) with radius 10.
; PLAN: r0=67(x), r1=237(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 237
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
