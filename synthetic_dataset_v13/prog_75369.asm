; DESCRIPTION: Draws a purple circle centered at (246, 123) with radius 48.
; PLAN: r0=246(x), r1=123(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 123
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
