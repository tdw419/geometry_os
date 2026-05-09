; DESCRIPTION: Composite: Sets a single black pixel at (115, 165) then Creates a white rectangular region at (299, 96) spanning 106 by 20 pixels.
; PLAN: r0=115(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=96(y), r7=106(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 96
LDI r7, 106
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
