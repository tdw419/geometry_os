; DESCRIPTION: Composite: Sets a single orange pixel at (104, 77) then Creates a white rectangular region at (192, 68) spanning 98 by 115 pixels.
; PLAN: r0=104(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=68(y), r7=98(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 192
LDI r6, 68
LDI r7, 98
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
