; DESCRIPTION: Composite: Draws a green circle centered at (164, 175) with radius 61 then Draws a yellow rectangle at (431, 181) with width 66 and height 41 then Sets a single orange pixel at (438, 5).
; PLAN: r0=164(x), r1=175(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=181(y), r7=66(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=5(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 175
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 181
LDI r7, 66
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 5
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
