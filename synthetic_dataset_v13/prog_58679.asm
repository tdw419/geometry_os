; DESCRIPTION: Draws a purple circle centered at (168, 86) with radius 69.
; PLAN: r0=168(x), r1=86(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 86
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
