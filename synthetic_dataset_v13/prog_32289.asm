; DESCRIPTION: Composite: Creates a black circular shape at (146, 156) with radius 73 then Sets a single green pixel at (428, 56) then Creates a yellow rectangular region at (194, 30) spanning 72 by 61 pixels.
; PLAN: r0=146(x), r1=156(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=56(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=30(y), r12=72(width), r13=61(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 156
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 56
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 194
LDI r11, 30
LDI r12, 72
LDI r13, 61
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
