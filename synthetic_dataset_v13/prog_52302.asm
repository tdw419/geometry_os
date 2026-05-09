; DESCRIPTION: Draws a purple circle centered at (280, 135) with radius 19.
; PLAN: r0=280(x), r1=135(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 135
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
