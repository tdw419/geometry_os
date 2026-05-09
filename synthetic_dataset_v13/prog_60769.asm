; DESCRIPTION: Composite: Creates a magenta rectangular region at (115, 76) spanning 116 by 78 pixels then Sets a single cyan pixel at (438, 233).
; PLAN: r0=115(x), r1=76(y), r2=116(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=233(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 76
LDI r2, 116
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 233
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
