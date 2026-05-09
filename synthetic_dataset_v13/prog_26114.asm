; DESCRIPTION: Composite: Draws a cyan circle centered at (338, 132) with radius 69 then Draws a white rectangle at (43, 110) with width 69 and height 111 then Draws a orange line from (306, 167) to (494, 36).
; PLAN: r0=338(x), r1=132(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=110(y), r7=69(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x1), r11=167(y1), r12=494(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 132
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 110
LDI r7, 69
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 167
LDI r12, 494
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
