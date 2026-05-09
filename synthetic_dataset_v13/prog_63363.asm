; DESCRIPTION: Composite: Sets a single yellow pixel at (157, 145) then Creates a cyan rectangular region at (308, 128) spanning 30 by 33 pixels.
; PLAN: r0=157(x), r1=145(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=128(y), r7=30(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 145
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 308
LDI r6, 128
LDI r7, 30
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
