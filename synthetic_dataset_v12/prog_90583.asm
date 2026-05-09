; DESCRIPTION: Composite: Places a orange dot at position (225, 245) then Draws a green circle centered at (272, 151) with radius 78 then Draws a purple rectangle at (178, 64) with width 118 and height 118.
; PLAN: r0=225(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=151(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=64(y), r12=118(width), r13=118(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 245
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 272
LDI r6, 151
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 64
LDI r12, 118
LDI r13, 118
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
