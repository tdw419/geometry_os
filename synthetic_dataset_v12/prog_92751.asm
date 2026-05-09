; DESCRIPTION: Composite: Places a green line segment connecting (491, 55) to (436, 17) then Places a orange circle of radius 45 at center (395, 142) then Draws a white rectangle at (284, 11) with width 43 and height 32.
; PLAN: r0=491(x1), r1=55(y1), r2=436(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=142(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=11(y), r12=43(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 55
LDI r2, 436
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 142
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 11
LDI r12, 43
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
