; DESCRIPTION: Composite: Draws a orange line from (123, 147) to (55, 203) then Places a white circle of radius 13 at center (151, 221) then Renders a black box of size 94x28 starting at (372, 41).
; PLAN: r0=123(x1), r1=147(y1), r2=55(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=221(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=372(x), r11=41(y), r12=94(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 147
LDI r2, 55
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 221
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 372
LDI r11, 41
LDI r12, 94
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
