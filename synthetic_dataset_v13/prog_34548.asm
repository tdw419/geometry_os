; DESCRIPTION: Composite: Draws a magenta circle centered at (164, 111) with radius 70 then Sets a single orange pixel at (343, 122).
; PLAN: r0=164(x), r1=111(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=122(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 111
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 122
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
