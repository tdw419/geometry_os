; DESCRIPTION: Composite: Creates a cyan rectangular region at (351, 35) spanning 11 by 61 pixels then Sets a single orange pixel at (113, 41).
; PLAN: r0=351(x), r1=35(y), r2=11(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=41(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 35
LDI r2, 11
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 41
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
