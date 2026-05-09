; DESCRIPTION: Draws a purple circle centered at (338, 188) with radius 66.
; PLAN: r0=338(x), r1=188(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 188
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
