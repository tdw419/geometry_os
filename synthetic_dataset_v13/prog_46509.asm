; DESCRIPTION: Composite: Sets a single purple pixel at (87, 48) then Creates a white circular shape at (280, 154) with radius 20.
; PLAN: r0=87(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=154(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 154
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
