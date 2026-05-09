; DESCRIPTION: Composite: Sets a single orange pixel at (435, 218) then Creates a white circular shape at (228, 152) with radius 27.
; PLAN: r0=435(x), r1=218(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=152(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 218
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 228
LDI r6, 152
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
