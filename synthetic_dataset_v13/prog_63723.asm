; DESCRIPTION: Draws a purple circle centered at (164, 56) with radius 54.
; PLAN: r0=164(x), r1=56(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 56
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
