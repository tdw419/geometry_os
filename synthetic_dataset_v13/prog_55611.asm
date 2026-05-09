; DESCRIPTION: Composite: Sets a single cyan pixel at (64, 181) then Creates a white circular shape at (83, 54) with radius 21.
; PLAN: r0=64(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=54(y), r7=21(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 54
LDI r7, 21
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
