; DESCRIPTION: Composite: Sets a single orange pixel at (376, 24) then Creates a green rectangular region at (50, 128) spanning 31 by 105 pixels.
; PLAN: r0=376(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=128(y), r7=31(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 50
LDI r6, 128
LDI r7, 31
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
