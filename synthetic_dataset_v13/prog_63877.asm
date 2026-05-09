; DESCRIPTION: Composite: Draws a white circle centered at (417, 104) with radius 59 then Renders a orange line between points (398, 104) and (254, 38) then Draws a black rectangle at (17, 43) with width 38 and height 21.
; PLAN: r0=417(x), r1=104(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=104(y1), r7=254(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=17(x), r11=43(y), r12=38(width), r13=21(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 104
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 104
LDI r7, 254
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 43
LDI r12, 38
LDI r13, 21
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
