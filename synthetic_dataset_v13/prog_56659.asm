; DESCRIPTION: Composite: Sets a single orange pixel at (29, 15) then Creates a white rectangular region at (147, 241) spanning 26 by 15 pixels then Draws a red circle centered at (337, 117) with radius 35.
; PLAN: r0=29(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=241(y), r7=26(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=117(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 147
LDI r6, 241
LDI r7, 26
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 117
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
