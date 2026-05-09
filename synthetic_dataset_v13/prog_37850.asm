; DESCRIPTION: Composite: Sets a single black pixel at (410, 41) then Creates a blue rectangular region at (341, 141) spanning 114 by 96 pixels then Draws a magenta circle centered at (99, 94) with radius 50.
; PLAN: r0=410(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=141(y), r7=114(width), r8=96(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=94(y), r12=50(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 41
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 141
LDI r7, 114
LDI r8, 96
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 94
LDI r12, 50
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
