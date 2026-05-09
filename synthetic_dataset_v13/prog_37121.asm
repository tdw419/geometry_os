; DESCRIPTION: Composite: Places a blue line segment connecting (308, 244) to (211, 135) then Creates a red rectangular region at (483, 4) spanning 17 by 115 pixels then Creates a white circular shape at (59, 206) with radius 27.
; PLAN: r0=308(x1), r1=244(y1), r2=211(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=4(y), r7=17(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=206(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 244
LDI r2, 211
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 4
LDI r7, 17
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 206
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
