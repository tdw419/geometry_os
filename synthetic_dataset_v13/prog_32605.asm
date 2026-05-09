; DESCRIPTION: Draws a purple circle centered at (71, 109) with radius 69.
; PLAN: r0=71(x), r1=109(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 109
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
