; DESCRIPTION: Composite: Sets a single blue pixel at (285, 96) then Creates a white circular shape at (441, 64) with radius 26.
; PLAN: r0=285(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=64(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 64
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
