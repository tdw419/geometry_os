; DESCRIPTION: Composite: Renders a yellow box of size 99x104 starting at (159, 55) then Places a green circle of radius 76 at center (432, 99) then Renders a blue line between points (304, 137) and (7, 121).
; PLAN: r0=159(x), r1=55(y), r2=99(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=99(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x1), r11=137(y1), r12=7(x2), r13=121(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 55
LDI r2, 99
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 99
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 137
LDI r12, 7
LDI r13, 121
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
