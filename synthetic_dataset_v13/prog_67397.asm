; DESCRIPTION: Draws a black circle centered at (323, 159) with radius 47.
; PLAN: r0=323(x), r1=159(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 159
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
