; DESCRIPTION: Composite: Places a red dot at position (213, 94) then Creates a black rectangular region at (364, 110) spanning 105 by 112 pixels then Creates a orange circular shape at (73, 134) with radius 24.
; PLAN: r0=213(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=110(y), r7=105(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=134(y), r12=24(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 110
LDI r7, 105
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 134
LDI r12, 24
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
