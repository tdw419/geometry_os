; DESCRIPTION: Composite: Places a orange dot at position (266, 94) then Creates a blue rectangular region at (348, 104) spanning 103 by 108 pixels then Draws a purple circle centered at (375, 66) with radius 64.
; PLAN: r0=266(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=104(y), r7=103(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=66(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 266
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 348
LDI r6, 104
LDI r7, 103
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 66
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
