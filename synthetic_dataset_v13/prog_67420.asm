; DESCRIPTION: Composite: Draws a orange circle centered at (413, 104) with radius 46 then Places a blue dot at position (451, 227) then Creates a white rectangular region at (348, 54) spanning 30 by 69 pixels.
; PLAN: r0=413(x), r1=104(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=227(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=54(y), r12=30(width), r13=69(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 104
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 227
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 54
LDI r12, 30
LDI r13, 69
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
