; DESCRIPTION: Composite: Sets a single blue pixel at (135, 211) then Creates a white circular shape at (261, 196) with radius 30.
; PLAN: r0=135(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=196(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 196
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
