; DESCRIPTION: Draws a purple circle centered at (378, 174) with radius 28.
; PLAN: r0=378(x), r1=174(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 174
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
