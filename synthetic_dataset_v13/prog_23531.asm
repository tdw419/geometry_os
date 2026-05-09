; DESCRIPTION: Composite: Sets a single yellow pixel at (204, 175) then Draws a magenta circle centered at (212, 150) with radius 75.
; PLAN: r0=204(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=150(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 204
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 212
LDI r6, 150
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
