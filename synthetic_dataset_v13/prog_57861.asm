; DESCRIPTION: Composite: Draws a cyan rectangle at (136, 19) with width 80 and height 34 then Places a orange dot at position (245, 173) then Draws a black circle centered at (316, 179) with radius 60.
; PLAN: r0=136(x), r1=19(y), r2=80(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=173(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=179(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 19
LDI r2, 80
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 173
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 316
LDI r11, 179
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
