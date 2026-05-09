; DESCRIPTION: Composite: Creates a black rectangular region at (137, 227) spanning 21 by 11 pixels then Creates a blue circular shape at (299, 215) with radius 21 then Sets a single black pixel at (163, 17).
; PLAN: r0=137(x), r1=227(y), r2=21(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=215(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x), r11=17(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 227
LDI r2, 21
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 215
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 17
LDI r12, 0x000000
PSET r10, r11, r12
HALT
