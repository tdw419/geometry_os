; DESCRIPTION: Composite: Sets a single red pixel at (71, 236) then Creates a cyan circular shape at (63, 157) with radius 27.
; PLAN: r0=71(x), r1=236(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=157(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 236
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 63
LDI r6, 157
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
