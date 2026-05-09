; DESCRIPTION: Composite: Places a white dot at position (314, 82) then Draws a magenta circle centered at (282, 144) with radius 22.
; PLAN: r0=314(x), r1=82(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=144(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 82
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 144
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
