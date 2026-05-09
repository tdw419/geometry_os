; DESCRIPTION: Composite: Places a black dot at position (129, 192) then Draws a purple circle centered at (118, 130) with radius 38 then Creates a black rectangular region at (234, 97) spanning 63 by 119 pixels.
; PLAN: r0=129(x), r1=192(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=130(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=234(x), r11=97(y), r12=63(width), r13=119(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 192
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 130
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 234
LDI r11, 97
LDI r12, 63
LDI r13, 119
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
