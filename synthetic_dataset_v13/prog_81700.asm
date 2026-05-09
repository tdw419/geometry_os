; DESCRIPTION: Draws a purple circle centered at (151, 161) with radius 30.
; PLAN: r0=151(x), r1=161(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 161
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
