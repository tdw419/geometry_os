; DESCRIPTION: Composite: Places a green line segment connecting (347, 83) to (484, 50) then Places a orange circle of radius 17 at center (119, 159) then Renders a yellow box of size 72x83 starting at (104, 163).
; PLAN: r0=347(x1), r1=83(y1), r2=484(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=159(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=163(y), r12=72(width), r13=83(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 83
LDI r2, 484
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 159
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 163
LDI r12, 72
LDI r13, 83
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
