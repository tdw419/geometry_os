; DESCRIPTION: Draws a purple circle centered at (384, 138) with radius 66.
; PLAN: r0=384(x), r1=138(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 138
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
