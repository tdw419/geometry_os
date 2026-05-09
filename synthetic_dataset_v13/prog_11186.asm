; DESCRIPTION: Composite: Sets a single orange pixel at (283, 195) then Creates a orange rectangular region at (118, 78) spanning 15 by 73 pixels then Draws a orange circle centered at (423, 46) with radius 16.
; PLAN: r0=283(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=78(y), r7=15(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=46(y), r12=16(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 118
LDI r6, 78
LDI r7, 15
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 46
LDI r12, 16
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
