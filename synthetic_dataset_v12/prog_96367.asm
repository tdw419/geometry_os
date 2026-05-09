; DESCRIPTION: Composite: Sets a single green pixel at (199, 126) then Creates a yellow circular shape at (376, 143) with radius 55 then Draws a purple rectangle at (170, 142) with width 68 and height 58.
; PLAN: r0=199(x), r1=126(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=143(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=142(y), r12=68(width), r13=58(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 126
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 376
LDI r6, 143
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 142
LDI r12, 68
LDI r13, 58
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
