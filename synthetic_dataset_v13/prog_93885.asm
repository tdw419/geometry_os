; DESCRIPTION: Draws a black circle centered at (176, 139) with radius 67.
; PLAN: r0=176(x), r1=139(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 139
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
