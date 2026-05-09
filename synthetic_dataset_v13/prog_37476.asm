; DESCRIPTION: Composite: Draws a magenta circle centered at (377, 40) with radius 26 then Sets a single orange pixel at (90, 21).
; PLAN: r0=377(x), r1=40(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=21(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 40
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 21
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
