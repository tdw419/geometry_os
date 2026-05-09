; DESCRIPTION: Draws a purple circle centered at (423, 130) with radius 39.
; PLAN: r0=423(x), r1=130(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 130
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
