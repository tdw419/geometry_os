; DESCRIPTION: Composite: Sets a single orange pixel at (220, 65) then Creates a orange circular shape at (351, 97) with radius 54.
; PLAN: r0=220(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=97(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 351
LDI r6, 97
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
