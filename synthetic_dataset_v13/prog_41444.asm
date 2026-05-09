; DESCRIPTION: Composite: Sets a single yellow pixel at (268, 190) then Creates a blue circular shape at (241, 71) with radius 57.
; PLAN: r0=268(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=71(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 241
LDI r6, 71
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
