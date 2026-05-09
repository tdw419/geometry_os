; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (416, 138) then Creates a black rectangular region at (97, 22) spanning 91 by 103 pixels then Places a cyan line segment connecting (377, 81) to (225, 55).
; PLAN: r0=416(x), r1=138(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=22(y), r7=91(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x1), r11=81(y1), r12=225(x2), r13=55(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 138
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 22
LDI r7, 91
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 81
LDI r12, 225
LDI r13, 55
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
