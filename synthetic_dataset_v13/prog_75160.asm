; DESCRIPTION: Composite: Sets a single green pixel at (12, 195) then Creates a purple circular shape at (335, 36) with radius 31.
; PLAN: r0=12(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=36(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 335
LDI r6, 36
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
