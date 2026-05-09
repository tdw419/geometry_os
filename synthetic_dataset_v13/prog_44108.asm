; DESCRIPTION: Composite: Creates a purple rectangular region at (75, 194) spanning 65 by 24 pixels then Sets a single black pixel at (334, 241).
; PLAN: r0=75(x), r1=194(y), r2=65(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=334(x), r6=241(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 194
LDI r2, 65
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 241
LDI r7, 0x000000
PSET r5, r6, r7
HALT
