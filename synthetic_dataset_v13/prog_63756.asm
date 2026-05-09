; DESCRIPTION: Draws a purple circle centered at (417, 125) with radius 49.
; PLAN: r0=417(x), r1=125(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 125
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
