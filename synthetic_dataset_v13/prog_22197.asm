; DESCRIPTION: Draws a purple circle centered at (414, 135) with radius 70.
; PLAN: r0=414(x), r1=135(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 135
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
