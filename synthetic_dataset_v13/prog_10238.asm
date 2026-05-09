; DESCRIPTION: Composite: Creates a white rectangular region at (196, 207) spanning 109 by 28 pixels then Creates a black circular shape at (341, 174) with radius 23 then Sets a single green pixel at (99, 80).
; PLAN: r0=196(x), r1=207(y), r2=109(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=174(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=80(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 207
LDI r2, 109
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 174
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 80
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
