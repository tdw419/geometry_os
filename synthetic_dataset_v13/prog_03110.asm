; DESCRIPTION: Composite: Creates a black rectangular region at (22, 75) spanning 11 by 76 pixels then Sets a single black pixel at (35, 199) then Creates a white circular shape at (405, 109) with radius 62.
; PLAN: r0=22(x), r1=75(y), r2=11(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=109(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 75
LDI r2, 11
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 405
LDI r11, 109
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
