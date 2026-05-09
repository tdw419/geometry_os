; DESCRIPTION: Composite: Creates a white rectangular region at (64, 99) spanning 86 by 61 pixels then Sets a single blue pixel at (135, 58) then Creates a magenta circular shape at (248, 186) with radius 15.
; PLAN: r0=64(x), r1=99(y), r2=86(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x), r6=58(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=186(y), r12=15(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 99
LDI r2, 86
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 58
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 186
LDI r12, 15
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
