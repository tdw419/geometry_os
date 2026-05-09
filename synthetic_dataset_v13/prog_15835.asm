; DESCRIPTION: Draws a purple circle centered at (271, 37) with radius 19.
; PLAN: r0=271(x), r1=37(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 37
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
