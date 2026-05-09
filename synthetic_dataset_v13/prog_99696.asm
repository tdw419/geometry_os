; DESCRIPTION: Composite: Sets a single cyan pixel at (320, 49) then Creates a green rectangular region at (158, 5) spanning 89 by 31 pixels.
; PLAN: r0=320(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=5(y), r7=89(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 158
LDI r6, 5
LDI r7, 89
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
