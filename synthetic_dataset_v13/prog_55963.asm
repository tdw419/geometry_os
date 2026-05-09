; DESCRIPTION: Draws a black circle centered at (97, 123) with radius 67.
; PLAN: r0=97(x), r1=123(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 123
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
