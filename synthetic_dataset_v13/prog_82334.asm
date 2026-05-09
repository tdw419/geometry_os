; DESCRIPTION: Composite: Places a yellow dot at position (347, 125) then Places a orange line segment connecting (264, 88) to (438, 20) then Draws a red rectangle at (421, 180) with width 83 and height 37.
; PLAN: r0=347(x), r1=125(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=264(x1), r6=88(y1), r7=438(x2), r8=20(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=180(y), r12=83(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 125
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 264
LDI r6, 88
LDI r7, 438
LDI r8, 20
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 180
LDI r12, 83
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
