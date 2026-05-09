; DESCRIPTION: Composite: Creates a black circular shape at (133, 137) with radius 57 then Creates a yellow rectangular region at (175, 245) spanning 35 by 11 pixels then Sets a single white pixel at (192, 169).
; PLAN: r0=133(x), r1=137(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=245(y), r7=35(width), r8=11(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=169(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 137
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 245
LDI r7, 35
LDI r8, 11
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 169
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
