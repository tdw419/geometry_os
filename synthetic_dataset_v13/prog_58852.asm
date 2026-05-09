; DESCRIPTION: Composite: Draws a white circle centered at (382, 44) with radius 21 then Creates a orange rectangular region at (153, 186) spanning 66 by 54 pixels then Places a yellow line segment connecting (119, 103) to (161, 249).
; PLAN: r0=382(x), r1=44(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=186(y), r7=66(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x1), r11=103(y1), r12=161(x2), r13=249(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 44
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 186
LDI r7, 66
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 103
LDI r12, 161
LDI r13, 249
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
