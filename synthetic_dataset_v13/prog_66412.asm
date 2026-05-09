; DESCRIPTION: Draws a purple circle centered at (268, 76) with radius 57.
; PLAN: r0=268(x), r1=76(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 76
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
