; DESCRIPTION: Composite: Sets a single green pixel at (388, 167) then Creates a blue circular shape at (343, 108) with radius 38.
; PLAN: r0=388(x), r1=167(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=108(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 167
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 343
LDI r6, 108
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
