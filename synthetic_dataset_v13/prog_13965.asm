; DESCRIPTION: Draws a purple circle centered at (68, 67) with radius 12.
; PLAN: r0=68(x), r1=67(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 67
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
