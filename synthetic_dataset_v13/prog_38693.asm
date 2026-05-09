; DESCRIPTION: Draws a purple circle centered at (276, 196) with radius 33.
; PLAN: r0=276(x), r1=196(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 196
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
