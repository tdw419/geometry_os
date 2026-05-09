; DESCRIPTION: Composite: Sets a single cyan pixel at (483, 100) then Creates a black rectangular region at (124, 87) spanning 60 by 52 pixels.
; PLAN: r0=483(x), r1=100(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=87(y), r7=60(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 100
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 87
LDI r7, 60
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
