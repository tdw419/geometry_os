; DESCRIPTION: Composite: Places a blue line segment connecting (443, 109) to (407, 214) then Draws a white circle centered at (248, 175) with radius 76 then Creates a white rectangular region at (195, 115) spanning 14 by 33 pixels.
; PLAN: r0=443(x1), r1=109(y1), r2=407(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=175(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=115(y), r12=14(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 109
LDI r2, 407
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 175
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 115
LDI r12, 14
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
