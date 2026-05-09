; DESCRIPTION: Composite: Places a orange dot at position (188, 253) then Creates a white rectangular region at (194, 139) spanning 40 by 61 pixels then Creates a magenta circular shape at (414, 104) with radius 69.
; PLAN: r0=188(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=139(y), r7=40(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=104(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 188
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 194
LDI r6, 139
LDI r7, 40
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 104
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
