; DESCRIPTION: Draws a purple circle centered at (407, 122) with radius 79.
; PLAN: r0=407(x), r1=122(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 122
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
