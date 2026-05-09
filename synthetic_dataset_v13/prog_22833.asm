; DESCRIPTION: Composite: Sets a single cyan pixel at (58, 169) then Creates a white rectangular region at (347, 115) spanning 96 by 54 pixels.
; PLAN: r0=58(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=115(y), r7=96(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 169
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 115
LDI r7, 96
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
