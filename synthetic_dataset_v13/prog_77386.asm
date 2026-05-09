; DESCRIPTION: Draws a purple circle centered at (359, 103) with radius 79.
; PLAN: r0=359(x), r1=103(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 103
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
