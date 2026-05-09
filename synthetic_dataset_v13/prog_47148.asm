; DESCRIPTION: Composite: Draws a yellow line from (160, 245) to (185, 138) then Creates a white rectangular region at (459, 144) spanning 53 by 82 pixels then Draws a white circle centered at (179, 56) with radius 49.
; PLAN: r0=160(x1), r1=245(y1), r2=185(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=144(y), r7=53(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=56(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 245
LDI r2, 185
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 144
LDI r7, 53
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 56
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
