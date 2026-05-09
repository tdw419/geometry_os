; DESCRIPTION: Composite: Places a black line segment connecting (13, 37) to (133, 234) then Renders a red disk with center (55, 55) and radius 25 then Creates a yellow rectangular region at (302, 85) spanning 12 by 104 pixels.
; PLAN: r0=13(x1), r1=37(y1), r2=133(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=55(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=302(x), r11=85(y), r12=12(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 37
LDI r2, 133
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 55
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 302
LDI r11, 85
LDI r12, 12
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
