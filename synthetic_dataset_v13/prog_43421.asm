; DESCRIPTION: Composite: Places a cyan dot at position (492, 66) then Places a orange line segment connecting (503, 91) to (283, 101) then Draws a black rectangle at (25, 101) with width 35 and height 109.
; PLAN: r0=492(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=503(x1), r6=91(y1), r7=283(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=25(x), r11=101(y), r12=35(width), r13=109(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 503
LDI r6, 91
LDI r7, 283
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 101
LDI r12, 35
LDI r13, 109
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
