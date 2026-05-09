; DESCRIPTION: Composite: Renders a yellow box of size 58x88 starting at (188, 76) then Creates a white circular shape at (250, 145) with radius 47 then Places a red line segment connecting (104, 234) to (32, 34).
; PLAN: r0=188(x), r1=76(y), r2=58(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=145(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x1), r11=234(y1), r12=32(x2), r13=34(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 76
LDI r2, 58
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 145
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 234
LDI r12, 32
LDI r13, 34
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
