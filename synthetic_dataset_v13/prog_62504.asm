; DESCRIPTION: Composite: Sets a single magenta pixel at (93, 114) then Draws a black circle centered at (335, 131) with radius 52.
; PLAN: r0=93(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=131(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 131
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
