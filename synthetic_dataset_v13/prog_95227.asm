; DESCRIPTION: Composite: Renders a black line between points (430, 224) and (425, 15) then Draws a black rectangle at (278, 136) with width 10 and height 117 then Places a orange circle of radius 54 at center (343, 173).
; PLAN: r0=430(x1), r1=224(y1), r2=425(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=136(y), r7=10(width), r8=117(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=173(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 224
LDI r2, 425
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 136
LDI r7, 10
LDI r8, 117
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 173
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
