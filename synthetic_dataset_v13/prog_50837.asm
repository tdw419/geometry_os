; DESCRIPTION: Composite: Places a orange dot at position (10, 163) then Creates a purple rectangular region at (14, 32) spanning 71 by 114 pixels then Draws a blue circle centered at (211, 99) with radius 77.
; PLAN: r0=10(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=14(x), r6=32(y), r7=71(width), r8=114(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x), r11=99(y), r12=77(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 163
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 14
LDI r6, 32
LDI r7, 71
LDI r8, 114
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 99
LDI r12, 77
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
