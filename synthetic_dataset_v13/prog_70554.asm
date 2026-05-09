; DESCRIPTION: Composite: Draws a yellow rectangle at (163, 221) with width 23 and height 17 then Sets a single black pixel at (56, 102) then Creates a black circular shape at (226, 101) with radius 58.
; PLAN: r0=163(x), r1=221(y), r2=23(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=226(x), r11=101(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 221
LDI r2, 23
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 226
LDI r11, 101
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
