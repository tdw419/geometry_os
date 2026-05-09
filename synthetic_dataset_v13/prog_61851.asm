; DESCRIPTION: Composite: Sets a single purple pixel at (398, 253) then Draws a magenta circle centered at (347, 155) with radius 78.
; PLAN: r0=398(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=155(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 155
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
