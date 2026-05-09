; DESCRIPTION: Composite: Sets a single blue pixel at (317, 41) then Creates a cyan circular shape at (371, 136) with radius 62.
; PLAN: r0=317(x), r1=41(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=136(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 317
LDI r1, 41
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 136
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
