; DESCRIPTION: Draws a green circle centered at (378, 82) with radius 74.
; PLAN: r0=378(x), r1=82(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 82
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
