; DESCRIPTION: Composite: Places a orange dot at position (148, 37) then Places a purple 78x37 rectangle at position (175, 117) then Creates a magenta circular shape at (268, 134) with radius 58.
; PLAN: r0=148(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=117(y), r7=78(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=134(y), r12=58(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 175
LDI r6, 117
LDI r7, 78
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 134
LDI r12, 58
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
