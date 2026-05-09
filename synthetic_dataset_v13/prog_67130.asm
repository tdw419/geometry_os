; DESCRIPTION: Composite: Sets a single green pixel at (359, 29) then Creates a cyan circular shape at (422, 118) with radius 11.
; PLAN: r0=359(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=118(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 422
LDI r6, 118
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
