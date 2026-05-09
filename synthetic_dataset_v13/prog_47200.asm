; DESCRIPTION: Composite: Sets a single purple pixel at (478, 68) then Creates a red circular shape at (296, 66) with radius 62.
; PLAN: r0=478(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=66(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 66
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
