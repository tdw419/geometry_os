; DESCRIPTION: Composite: Creates a yellow rectangular region at (322, 40) spanning 79 by 18 pixels then Sets a single green pixel at (501, 74).
; PLAN: r0=322(x), r1=40(y), r2=79(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x), r6=74(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 40
LDI r2, 79
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 74
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
