; DESCRIPTION: Creates a black circular shape at (155, 67) with radius 58.
; PLAN: r0=155(x), r1=67(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 67
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
