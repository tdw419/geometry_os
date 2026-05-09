; DESCRIPTION: Draws a purple circle centered at (291, 208) with radius 19.
; PLAN: r0=291(x), r1=208(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 208
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
