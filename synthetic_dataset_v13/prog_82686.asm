; DESCRIPTION: Draws a black circle centered at (378, 74) with radius 12.
; PLAN: r0=378(x), r1=74(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 74
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
