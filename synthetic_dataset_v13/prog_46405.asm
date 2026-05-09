; DESCRIPTION: Draws a purple circle centered at (381, 178) with radius 25.
; PLAN: r0=381(x), r1=178(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 178
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
