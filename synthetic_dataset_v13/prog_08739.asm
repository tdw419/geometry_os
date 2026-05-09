; DESCRIPTION: Draws a purple circle centered at (128, 111) with radius 69.
; PLAN: r0=128(x), r1=111(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 111
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
