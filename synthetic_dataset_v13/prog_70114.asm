; DESCRIPTION: Composite: Draws a white rectangle at (316, 21) with width 46 and height 43 then Renders a orange line between points (176, 55) and (44, 38) then Places a red circle of radius 77 at center (327, 109).
; PLAN: r0=316(x), r1=21(y), r2=46(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x1), r6=55(y1), r7=44(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=109(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 21
LDI r2, 46
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 55
LDI r7, 44
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 109
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
