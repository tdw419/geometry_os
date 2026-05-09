; DESCRIPTION: Composite: Places a blue dot at position (24, 136) then Creates a orange rectangular region at (253, 109) spanning 108 by 118 pixels then Draws a black circle centered at (430, 167) with radius 63.
; PLAN: r0=24(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=109(y), r7=108(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x), r11=167(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 109
LDI r7, 108
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 167
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
