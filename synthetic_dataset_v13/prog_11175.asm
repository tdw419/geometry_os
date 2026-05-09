; DESCRIPTION: Composite: Draws a red line from (459, 181) to (171, 166) then Draws a black rectangle at (56, 6) with width 98 and height 107 then Draws a orange circle centered at (111, 104) with radius 26.
; PLAN: r0=459(x1), r1=181(y1), r2=171(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=6(y), r7=98(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=104(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 181
LDI r2, 171
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 6
LDI r7, 98
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 104
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
