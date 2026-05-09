; DESCRIPTION: Composite: Places a purple dot at position (438, 118) then Creates a black rectangular region at (338, 31) spanning 58 by 114 pixels.
; PLAN: r0=438(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=31(y), r7=58(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 31
LDI r7, 58
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
