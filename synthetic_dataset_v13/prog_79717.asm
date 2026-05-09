; DESCRIPTION: Composite: Places a black dot at position (428, 212) then Creates a cyan rectangular region at (153, 88) spanning 115 by 31 pixels.
; PLAN: r0=428(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=88(y), r7=115(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 153
LDI r6, 88
LDI r7, 115
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
