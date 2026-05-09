; DESCRIPTION: Draws a purple circle centered at (368, 171) with radius 69.
; PLAN: r0=368(x), r1=171(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 171
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
