; DESCRIPTION: Composite: Sets a single green pixel at (485, 242) then Creates a cyan circular shape at (194, 128) with radius 41.
; PLAN: r0=485(x), r1=242(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=128(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 485
LDI r1, 242
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 128
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
