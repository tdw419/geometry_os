; DESCRIPTION: Composite: Draws a magenta circle centered at (116, 66) with radius 49 then Sets a single magenta pixel at (56, 151).
; PLAN: r0=116(x), r1=66(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=151(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 66
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 151
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
