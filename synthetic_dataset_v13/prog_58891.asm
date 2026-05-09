; DESCRIPTION: Composite: Creates a white rectangular region at (407, 167) spanning 78 by 84 pixels then Sets a single yellow pixel at (171, 62).
; PLAN: r0=407(x), r1=167(y), r2=78(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=62(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 167
LDI r2, 78
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 62
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
