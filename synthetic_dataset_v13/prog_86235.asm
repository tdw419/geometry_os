; DESCRIPTION: Draws a purple circle centered at (246, 142) with radius 34.
; PLAN: r0=246(x), r1=142(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 142
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
