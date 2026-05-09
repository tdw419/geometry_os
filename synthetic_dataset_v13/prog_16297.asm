; DESCRIPTION: Composite: Creates a white rectangular region at (93, 32) spanning 103 by 16 pixels then Sets a single orange pixel at (494, 41) then Creates a black circular shape at (58, 147) with radius 38.
; PLAN: r0=93(x), r1=32(y), r2=103(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=41(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=147(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 32
LDI r2, 103
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 41
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 58
LDI r11, 147
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
