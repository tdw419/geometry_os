; DESCRIPTION: Composite: Places a orange dot at position (456, 118) then Creates a black rectangular region at (88, 112) spanning 22 by 83 pixels then Creates a green circular shape at (89, 52) with radius 44.
; PLAN: r0=456(x), r1=118(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=112(y), r7=22(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x), r11=52(y), r12=44(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 456
LDI r1, 118
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 88
LDI r6, 112
LDI r7, 22
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 52
LDI r12, 44
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
