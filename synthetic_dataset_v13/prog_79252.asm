; DESCRIPTION: Composite: Creates a black rectangular region at (351, 160) spanning 110 by 22 pixels then Sets a single green pixel at (278, 88).
; PLAN: r0=351(x), r1=160(y), r2=110(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 160
LDI r2, 110
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
