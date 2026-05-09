; DESCRIPTION: Draws a green circle centered at (378, 113) with radius 61.
; PLAN: r0=378(x), r1=113(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 113
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
