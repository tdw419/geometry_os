; DESCRIPTION: Composite: Sets a single white pixel at (166, 237) then Creates a green circular shape at (413, 79) with radius 78.
; PLAN: r0=166(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=79(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 79
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
