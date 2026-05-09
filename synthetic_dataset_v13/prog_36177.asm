; DESCRIPTION: Composite: Places a red dot at position (353, 188) then Draws a black rectangle at (111, 29) with width 55 and height 31 then Draws a magenta circle centered at (99, 169) with radius 53.
; PLAN: r0=353(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=29(y), r7=55(width), r8=31(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=169(y), r12=53(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 111
LDI r6, 29
LDI r7, 55
LDI r8, 31
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 169
LDI r12, 53
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
