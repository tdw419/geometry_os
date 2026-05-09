; DESCRIPTION: Composite: Creates a orange rectangular region at (248, 89) spanning 98 by 11 pixels then Places a orange dot at position (213, 176).
; PLAN: r0=248(x), r1=89(y), r2=98(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=176(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 89
LDI r2, 98
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 176
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
