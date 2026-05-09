; DESCRIPTION: Composite: Creates a white rectangular region at (7, 137) spanning 69 by 76 pixels then Sets a single purple pixel at (390, 194).
; PLAN: r0=7(x), r1=137(y), r2=69(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=194(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 137
LDI r2, 69
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 194
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
