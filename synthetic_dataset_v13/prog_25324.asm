; DESCRIPTION: Composite: Places a red line segment connecting (133, 245) to (15, 138) then Places a yellow circle of radius 67 at center (244, 178) then Creates a blue rectangular region at (205, 13) spanning 119 by 120 pixels.
; PLAN: r0=133(x1), r1=245(y1), r2=15(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=178(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=13(y), r12=119(width), r13=120(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 245
LDI r2, 15
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 178
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 13
LDI r12, 119
LDI r13, 120
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
