; DESCRIPTION: Composite: Creates a white rectangular region at (211, 203) spanning 76 by 15 pixels then Sets a single white pixel at (351, 169).
; PLAN: r0=211(x), r1=203(y), r2=76(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 203
LDI r2, 76
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
