; DESCRIPTION: Composite: Sets a single orange pixel at (447, 8) then Draws a magenta circle centered at (199, 174) with radius 18.
; PLAN: r0=447(x), r1=8(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=174(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 447
LDI r1, 8
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 199
LDI r6, 174
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
