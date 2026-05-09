; DESCRIPTION: Composite: Sets a single magenta pixel at (400, 251) then Creates a black circular shape at (383, 212) with radius 43.
; PLAN: r0=400(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=212(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 251
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 212
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
