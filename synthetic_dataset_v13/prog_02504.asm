; DESCRIPTION: Composite: Places a orange circle of radius 61 at center (154, 83) then Places a white dot at position (261, 241) then Draws a black rectangle at (9, 17) with width 117 and height 91.
; PLAN: r0=154(x), r1=83(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=241(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=17(y), r12=117(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 83
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 241
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 9
LDI r11, 17
LDI r12, 117
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
