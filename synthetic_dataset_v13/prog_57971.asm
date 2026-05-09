; DESCRIPTION: Composite: Places a yellow dot at position (491, 158) then Draws a purple circle centered at (172, 179) with radius 37 then Draws a black rectangle at (38, 99) with width 107 and height 99.
; PLAN: r0=491(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=179(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=99(y), r12=107(width), r13=99(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 158
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 172
LDI r6, 179
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 99
LDI r12, 107
LDI r13, 99
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
