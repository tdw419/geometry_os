; DESCRIPTION: Draws a purple circle centered at (439, 167) with radius 66.
; PLAN: r0=439(x), r1=167(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 167
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
