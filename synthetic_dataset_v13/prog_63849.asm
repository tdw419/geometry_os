; DESCRIPTION: Draws a purple circle centered at (373, 153) with radius 69.
; PLAN: r0=373(x), r1=153(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 153
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
