; DESCRIPTION: Composite: Creates a white rectangular region at (88, 73) spanning 42 by 72 pixels then Places a green line segment connecting (330, 169) to (327, 230) then Draws a green circle centered at (326, 149) with radius 55.
; PLAN: r0=88(x), r1=73(y), r2=42(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x1), r6=169(y1), r7=327(x2), r8=230(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=149(y), r12=55(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 73
LDI r2, 42
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 169
LDI r7, 327
LDI r8, 230
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 149
LDI r12, 55
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
