; DESCRIPTION: Draws a purple circle centered at (214, 181) with radius 23.
; PLAN: r0=214(x), r1=181(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 181
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
