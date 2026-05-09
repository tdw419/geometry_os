; DESCRIPTION: Draws a purple circle centered at (137, 179) with radius 55.
; PLAN: r0=137(x), r1=179(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 179
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
