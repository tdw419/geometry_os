; DESCRIPTION: Composite: Sets a single red pixel at (297, 181) then Creates a orange rectangular region at (182, 106) spanning 61 by 26 pixels then Creates a white circular shape at (414, 88) with radius 54.
; PLAN: r0=297(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=106(y), r7=61(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=88(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 182
LDI r6, 106
LDI r7, 61
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 88
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
