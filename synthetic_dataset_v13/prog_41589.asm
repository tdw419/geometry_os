; DESCRIPTION: Composite: Creates a orange circular shape at (269, 75) with radius 71 then Creates a yellow rectangular region at (49, 141) spanning 55 by 75 pixels then Sets a single black pixel at (485, 135).
; PLAN: r0=269(x), r1=75(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=141(y), r7=55(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=485(x), r11=135(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 75
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 141
LDI r7, 55
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 135
LDI r12, 0x000000
PSET r10, r11, r12
HALT
