; DESCRIPTION: Composite: Sets a single cyan pixel at (195, 217) then Creates a white circular shape at (72, 184) with radius 27.
; PLAN: r0=195(x), r1=217(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=184(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 217
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 184
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
