; DESCRIPTION: Composite: Sets a single purple pixel at (472, 182) then Creates a magenta circular shape at (405, 87) with radius 37.
; PLAN: r0=472(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=87(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 472
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 87
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
