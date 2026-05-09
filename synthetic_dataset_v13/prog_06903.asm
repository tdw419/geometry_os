; DESCRIPTION: Composite: Creates a magenta rectangular region at (389, 78) spanning 37 by 17 pixels then Sets a single blue pixel at (276, 40).
; PLAN: r0=389(x), r1=78(y), r2=37(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=40(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 78
LDI r2, 37
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 40
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
