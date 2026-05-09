; DESCRIPTION: Draws a purple circle centered at (49, 127) with radius 13.
; PLAN: r0=49(x), r1=127(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 127
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
