; DESCRIPTION: Draws a magenta circle centered at (378, 97) with radius 18.
; PLAN: r0=378(x), r1=97(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 97
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
