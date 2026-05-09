; DESCRIPTION: Draws a black circle centered at (188, 87) with radius 73.
; PLAN: r0=188(x), r1=87(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 87
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
