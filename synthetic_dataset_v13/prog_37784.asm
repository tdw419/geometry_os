; DESCRIPTION: Composite: Draws a cyan line from (244, 69) to (317, 104) then Creates a orange rectangular region at (176, 202) spanning 114 by 15 pixels then Draws a purple circle centered at (424, 59) with radius 30.
; PLAN: r0=244(x1), r1=69(y1), r2=317(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=202(y), r7=114(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=424(x), r11=59(y), r12=30(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 69
LDI r2, 317
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 202
LDI r7, 114
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 59
LDI r12, 30
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
