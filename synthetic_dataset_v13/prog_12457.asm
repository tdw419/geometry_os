; DESCRIPTION: Composite: Places a green dot at position (10, 230) then Creates a yellow rectangular region at (260, 181) spanning 58 by 39 pixels then Draws a magenta circle centered at (101, 185) with radius 29.
; PLAN: r0=10(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=181(y), r7=58(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x), r11=185(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 230
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 181
LDI r7, 58
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 185
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
