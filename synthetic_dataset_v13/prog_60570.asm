; DESCRIPTION: Draws a purple circle centered at (124, 178) with radius 67.
; PLAN: r0=124(x), r1=178(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 178
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
