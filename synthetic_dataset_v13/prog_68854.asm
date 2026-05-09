; DESCRIPTION: Composite: Draws a magenta circle centered at (379, 100) with radius 71 then Sets a single yellow pixel at (111, 185).
; PLAN: r0=379(x), r1=100(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=185(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 100
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 185
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
