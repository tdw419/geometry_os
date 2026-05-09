; DESCRIPTION: Draws a purple circle centered at (177, 164) with radius 67.
; PLAN: r0=177(x), r1=164(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 164
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
