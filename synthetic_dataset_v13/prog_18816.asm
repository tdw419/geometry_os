; DESCRIPTION: Composite: Places a green line segment connecting (39, 178) to (493, 248) then Creates a yellow rectangular region at (247, 148) spanning 96 by 56 pixels then Creates a orange circular shape at (270, 66) with radius 29.
; PLAN: r0=39(x1), r1=178(y1), r2=493(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=148(y), r7=96(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=66(y), r12=29(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 178
LDI r2, 493
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 148
LDI r7, 96
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 66
LDI r12, 29
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
