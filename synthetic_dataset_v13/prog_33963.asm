; DESCRIPTION: Draws a purple circle centered at (134, 189) with radius 56.
; PLAN: r0=134(x), r1=189(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 189
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
