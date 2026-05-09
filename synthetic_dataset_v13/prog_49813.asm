; DESCRIPTION: Composite: Sets a single green pixel at (314, 102) then Creates a cyan rectangular region at (68, 79) spanning 97 by 48 pixels.
; PLAN: r0=314(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=79(y), r7=97(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 79
LDI r7, 97
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
