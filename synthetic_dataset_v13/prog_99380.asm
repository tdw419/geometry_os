; DESCRIPTION: Composite: Creates a black rectangular region at (119, 214) spanning 74 by 18 pixels then Sets a single cyan pixel at (447, 17) then Creates a white circular shape at (444, 179) with radius 57.
; PLAN: r0=119(x), r1=214(y), r2=74(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=17(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=444(x), r11=179(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 214
LDI r2, 74
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 17
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 179
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
