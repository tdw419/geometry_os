; DESCRIPTION: Composite: Places a black dot at position (259, 147) then Draws a magenta circle centered at (207, 82) with radius 56.
; PLAN: r0=259(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=82(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 82
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
