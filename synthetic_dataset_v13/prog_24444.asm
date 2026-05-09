; DESCRIPTION: Composite: Sets a single green pixel at (321, 172) then Draws a magenta circle centered at (424, 44) with radius 26.
; PLAN: r0=321(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=44(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 424
LDI r6, 44
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
