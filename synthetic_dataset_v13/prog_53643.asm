; DESCRIPTION: Composite: Places a white dot at position (192, 29) then Draws a blue circle centered at (256, 162) with radius 78 then Draws a black rectangle at (304, 13) with width 20 and height 97.
; PLAN: r0=192(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=162(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=13(y), r12=20(width), r13=97(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 162
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 13
LDI r12, 20
LDI r13, 97
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
