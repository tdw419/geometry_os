; DESCRIPTION: Composite: Creates a yellow circular shape at (399, 62) with radius 13 then Creates a blue rectangular region at (411, 104) spanning 48 by 40 pixels then Sets a single green pixel at (3, 17).
; PLAN: r0=399(x), r1=62(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=104(y), r7=48(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=3(x), r11=17(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 62
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 104
LDI r7, 48
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 17
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
