; DESCRIPTION: Composite: Sets a single yellow pixel at (385, 115) then Creates a cyan circular shape at (291, 121) with radius 73.
; PLAN: r0=385(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=121(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 385
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 291
LDI r6, 121
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
