; DESCRIPTION: Composite: Places a black dot at position (263, 62) then Draws a magenta circle centered at (84, 129) with radius 75 then Draws a purple rectangle at (58, 97) with width 40 and height 81.
; PLAN: r0=263(x), r1=62(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=129(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=97(y), r12=40(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 62
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 84
LDI r6, 129
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 97
LDI r12, 40
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
