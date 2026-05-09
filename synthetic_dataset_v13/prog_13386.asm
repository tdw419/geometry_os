; DESCRIPTION: Draws a purple circle centered at (179, 113) with radius 75.
; PLAN: r0=179(x), r1=113(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 113
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
