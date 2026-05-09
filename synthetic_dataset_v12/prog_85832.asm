; DESCRIPTION: Composite: Places a magenta dot at position (53, 97) then Draws a black circle centered at (308, 112) with radius 51.
; PLAN: r0=53(x), r1=97(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=112(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 97
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 112
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
