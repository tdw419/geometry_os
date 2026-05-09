; DESCRIPTION: Composite: Creates a magenta rectangular region at (405, 159) spanning 78 by 39 pixels then Places a cyan dot at position (351, 9).
; PLAN: r0=405(x), r1=159(y), r2=78(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 159
LDI r2, 78
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
