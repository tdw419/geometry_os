; DESCRIPTION: Draws a purple circle centered at (207, 67) with radius 58.
; PLAN: r0=207(x), r1=67(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 67
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
