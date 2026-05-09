; DESCRIPTION: Composite: Sets a single red pixel at (176, 40) then Creates a white rectangular region at (119, 200) spanning 49 by 27 pixels.
; PLAN: r0=176(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=200(y), r7=49(width), r8=27(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 119
LDI r6, 200
LDI r7, 49
LDI r8, 27
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
