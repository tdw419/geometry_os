; DESCRIPTION: Composite: Draws a yellow rectangle at (316, 115) with width 90 and height 57 then Sets a single green pixel at (362, 46) then Creates a green circular shape at (302, 50) with radius 41.
; PLAN: r0=316(x), r1=115(y), r2=90(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=46(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=50(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 115
LDI r2, 90
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 46
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 302
LDI r11, 50
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
