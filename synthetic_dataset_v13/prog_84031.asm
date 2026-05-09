; DESCRIPTION: Draws a purple circle centered at (452, 63) with radius 19.
; PLAN: r0=452(x), r1=63(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 63
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
