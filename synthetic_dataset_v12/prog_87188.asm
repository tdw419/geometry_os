; DESCRIPTION: Draws a purple circle centered at (154, 181) with radius 60.
; PLAN: r0=154(x), r1=181(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 181
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
