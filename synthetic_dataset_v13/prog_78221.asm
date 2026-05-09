; DESCRIPTION: Composite: Sets a single white pixel at (84, 93) then Creates a blue circular shape at (378, 74) with radius 37.
; PLAN: r0=84(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=74(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 84
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 74
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
