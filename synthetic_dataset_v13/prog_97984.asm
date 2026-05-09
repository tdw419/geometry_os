; DESCRIPTION: Draws a purple circle centered at (113, 96) with radius 50.
; PLAN: r0=113(x), r1=96(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 96
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
