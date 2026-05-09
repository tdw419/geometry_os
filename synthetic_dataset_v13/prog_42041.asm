; DESCRIPTION: Draws a blue circle centered at (179, 179) with radius 55.
; PLAN: r0=179(x), r1=179(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 179
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
