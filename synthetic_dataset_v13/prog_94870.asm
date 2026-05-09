; DESCRIPTION: Composite: Creates a blue rectangular region at (158, 206) spanning 70 by 41 pixels then Places a black dot at position (94, 214) then Draws a magenta circle centered at (136, 182) with radius 29.
; PLAN: r0=158(x), r1=206(y), r2=70(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=214(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=182(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 206
LDI r2, 70
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 214
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 136
LDI r11, 182
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
