; DESCRIPTION: Draws a purple circle centered at (140, 116) with radius 76.
; PLAN: r0=140(x), r1=116(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 116
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
