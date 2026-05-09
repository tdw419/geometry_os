; DESCRIPTION: Composite: Places a black dot at position (462, 4) then Draws a magenta circle centered at (163, 219) with radius 28.
; PLAN: r0=462(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=219(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 163
LDI r6, 219
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
