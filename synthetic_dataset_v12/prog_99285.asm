; DESCRIPTION: Composite: Draws a red circle centered at (318, 89) with radius 29 then Sets a single red pixel at (414, 58) then Draws a purple rectangle at (17, 19) with width 73 and height 117.
; PLAN: r0=318(x), r1=89(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=58(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=19(y), r12=73(width), r13=117(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 89
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 58
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 17
LDI r11, 19
LDI r12, 73
LDI r13, 117
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
