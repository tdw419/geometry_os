; DESCRIPTION: Composite: Sets a single red pixel at (258, 224) then Creates a cyan circular shape at (307, 126) with radius 10.
; PLAN: r0=258(x), r1=224(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=126(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 224
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 307
LDI r6, 126
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
