; DESCRIPTION: Draws a purple circle centered at (151, 113) with radius 69.
; PLAN: r0=151(x), r1=113(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 113
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
