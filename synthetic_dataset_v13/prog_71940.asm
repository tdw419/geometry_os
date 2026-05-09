; DESCRIPTION: Composite: Sets a single purple pixel at (475, 50) then Creates a cyan circular shape at (238, 88) with radius 58.
; PLAN: r0=475(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=88(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 88
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
