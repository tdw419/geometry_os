; DESCRIPTION: Draws a purple circle centered at (414, 159) with radius 67.
; PLAN: r0=414(x), r1=159(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 159
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
