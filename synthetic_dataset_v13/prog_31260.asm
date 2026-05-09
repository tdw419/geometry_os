; DESCRIPTION: Composite: Sets a single yellow pixel at (226, 215) then Creates a cyan rectangular region at (10, 156) spanning 104 by 37 pixels.
; PLAN: r0=226(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=156(y), r7=104(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 215
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 10
LDI r6, 156
LDI r7, 104
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
