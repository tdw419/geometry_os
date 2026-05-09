; DESCRIPTION: Composite: Places a magenta circle of radius 51 at center (88, 175) then Sets a single magenta pixel at (84, 78).
; PLAN: r0=88(x), r1=175(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=78(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 175
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 78
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
