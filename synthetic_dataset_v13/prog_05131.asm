; DESCRIPTION: Composite: Sets a single magenta pixel at (88, 133) then Draws a magenta circle centered at (175, 157) with radius 45.
; PLAN: r0=88(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=157(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 88
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 157
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
