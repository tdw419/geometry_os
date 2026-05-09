; DESCRIPTION: Composite: Creates a green rectangular region at (232, 49) spanning 37 by 114 pixels then Sets a single orange pixel at (372, 158).
; PLAN: r0=232(x), r1=49(y), r2=37(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=158(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 49
LDI r2, 37
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 158
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
