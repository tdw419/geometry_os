; DESCRIPTION: Composite: Creates a red rectangular region at (184, 68) spanning 114 by 117 pixels then Creates a black circular shape at (474, 78) with radius 15 then Sets a single orange pixel at (501, 114).
; PLAN: r0=184(x), r1=68(y), r2=114(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=78(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=501(x), r11=114(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 68
LDI r2, 114
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 78
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 501
LDI r11, 114
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
