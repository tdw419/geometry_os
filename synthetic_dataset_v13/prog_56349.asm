; DESCRIPTION: Composite: Draws a magenta circle centered at (94, 178) with radius 70 then Sets a single magenta pixel at (241, 28).
; PLAN: r0=94(x), r1=178(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=28(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 178
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 28
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
