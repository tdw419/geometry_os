; DESCRIPTION: Composite: Creates a purple rectangular region at (332, 121) spanning 66 by 76 pixels then Sets a single purple pixel at (277, 11).
; PLAN: r0=332(x), r1=121(y), r2=66(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=11(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 121
LDI r2, 66
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 11
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
