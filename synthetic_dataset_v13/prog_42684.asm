; DESCRIPTION: Composite: Creates a black circular shape at (331, 118) with radius 15 then Creates a black rectangular region at (225, 8) spanning 116 by 73 pixels then Places a blue dot at position (469, 33).
; PLAN: r0=331(x), r1=118(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=8(y), r7=116(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x), r11=33(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 118
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 8
LDI r7, 116
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 33
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
