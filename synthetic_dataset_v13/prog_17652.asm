; DESCRIPTION: Composite: Places a black dot at position (140, 64) then Draws a purple circle centered at (310, 90) with radius 43.
; PLAN: r0=140(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=90(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 90
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
