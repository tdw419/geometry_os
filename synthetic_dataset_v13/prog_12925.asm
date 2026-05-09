; DESCRIPTION: Draws a purple circle centered at (291, 117) with radius 27.
; PLAN: r0=291(x), r1=117(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 117
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
