; DESCRIPTION: Composite: Draws a magenta rectangle at (361, 43) with width 83 and height 39 then Creates a blue circular shape at (255, 144) with radius 62 then Draws a white line from (47, 148) to (127, 187).
; PLAN: r0=361(x), r1=43(y), r2=83(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=144(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x1), r11=148(y1), r12=127(x2), r13=187(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 43
LDI r2, 83
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 144
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 148
LDI r12, 127
LDI r13, 187
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
