; DESCRIPTION: Composite: Creates a green rectangular region at (94, 15) spanning 95 by 108 pixels then Sets a single green pixel at (276, 131).
; PLAN: r0=94(x), r1=15(y), r2=95(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=131(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 15
LDI r2, 95
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 131
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
