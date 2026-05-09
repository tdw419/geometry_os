; DESCRIPTION: Composite: Places a magenta circle of radius 73 at center (75, 81) then Sets a single magenta pixel at (11, 254).
; PLAN: r0=75(x), r1=81(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=254(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 81
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 254
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
