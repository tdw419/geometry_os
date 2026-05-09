; DESCRIPTION: Composite: Sets a single blue pixel at (46, 152) then Creates a cyan circular shape at (348, 122) with radius 55.
; PLAN: r0=46(x), r1=152(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=122(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 152
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 122
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
