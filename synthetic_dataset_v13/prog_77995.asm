; DESCRIPTION: Composite: Places a black dot at position (231, 165) then Creates a red rectangular region at (414, 41) spanning 38 by 17 pixels then Draws a red circle centered at (327, 146) with radius 46.
; PLAN: r0=231(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=41(y), r7=38(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=146(y), r12=46(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 41
LDI r7, 38
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 146
LDI r12, 46
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
