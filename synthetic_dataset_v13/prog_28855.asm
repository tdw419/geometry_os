; DESCRIPTION: Composite: Places a yellow dot at position (241, 59) then Places a orange line segment connecting (485, 54) to (226, 41) then Draws a white rectangle at (164, 33) with width 116 and height 68.
; PLAN: r0=241(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=54(y1), r7=226(x2), r8=41(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=33(y), r12=116(width), r13=68(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 485
LDI r6, 54
LDI r7, 226
LDI r8, 41
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 33
LDI r12, 116
LDI r13, 68
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
