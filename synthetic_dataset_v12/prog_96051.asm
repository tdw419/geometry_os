; DESCRIPTION: Draws a purple circle centered at (291, 198) with radius 49.
; PLAN: r0=291(x), r1=198(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 198
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
