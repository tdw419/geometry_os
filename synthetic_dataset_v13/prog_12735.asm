; DESCRIPTION: Composite: Sets a single blue pixel at (343, 251) then Places a white circle of radius 47 at center (319, 75).
; PLAN: r0=343(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=75(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 75
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
