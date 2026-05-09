; DESCRIPTION: Composite: Draws a yellow circle centered at (69, 102) with radius 32 then Creates a white rectangular region at (376, 60) spanning 90 by 91 pixels then Places a yellow line segment connecting (140, 205) to (476, 226).
; PLAN: r0=69(x), r1=102(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=60(y), r7=90(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x1), r11=205(y1), r12=476(x2), r13=226(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 102
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 60
LDI r7, 90
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 205
LDI r12, 476
LDI r13, 226
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
