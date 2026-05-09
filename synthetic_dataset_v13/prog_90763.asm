; DESCRIPTION: Composite: Sets a single red pixel at (432, 22) then Creates a red rectangular region at (309, 128) spanning 78 by 118 pixels.
; PLAN: r0=432(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=128(y), r7=78(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 22
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 128
LDI r7, 78
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
