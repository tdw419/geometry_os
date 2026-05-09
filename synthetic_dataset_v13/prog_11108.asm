; DESCRIPTION: Composite: Sets a single magenta pixel at (324, 175) then Places a magenta circle of radius 73 at center (390, 158).
; PLAN: r0=324(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=158(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 158
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
