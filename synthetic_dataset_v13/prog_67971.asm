; DESCRIPTION: Draws a purple circle centered at (417, 159) with radius 25.
; PLAN: r0=417(x), r1=159(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 159
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
