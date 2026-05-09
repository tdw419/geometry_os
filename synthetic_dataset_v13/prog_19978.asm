; DESCRIPTION: Composite: Places a orange dot at position (166, 87) then Creates a white rectangular region at (252, 57) spanning 90 by 110 pixels then Creates a purple circular shape at (264, 95) with radius 63.
; PLAN: r0=166(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=57(y), r7=90(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=264(x), r11=95(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 87
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 252
LDI r6, 57
LDI r7, 90
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 95
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
