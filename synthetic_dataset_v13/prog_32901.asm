; DESCRIPTION: Composite: Creates a yellow circular shape at (486, 104) with radius 21 then Draws a orange rectangle at (38, 155) with width 112 and height 23 then Places a black dot at position (71, 26).
; PLAN: r0=486(x), r1=104(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=155(y), r7=112(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=26(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 104
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 155
LDI r7, 112
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 26
LDI r12, 0x000000
PSET r10, r11, r12
HALT
