; DESCRIPTION: Composite: Creates a white rectangular region at (41, 207) spanning 112 by 12 pixels then Sets a single green pixel at (122, 183).
; PLAN: r0=41(x), r1=207(y), r2=112(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 207
LDI r2, 112
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
