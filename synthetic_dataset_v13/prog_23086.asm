; DESCRIPTION: Composite: Sets a single green pixel at (275, 13) then Creates a green circular shape at (107, 116) with radius 63.
; PLAN: r0=275(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=116(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 107
LDI r6, 116
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
