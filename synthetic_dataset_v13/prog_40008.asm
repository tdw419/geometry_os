; DESCRIPTION: Composite: Creates a magenta rectangular region at (337, 148) spanning 115 by 58 pixels then Places a red line segment connecting (54, 214) to (136, 28) then Creates a black circular shape at (268, 53) with radius 25.
; PLAN: r0=337(x), r1=148(y), r2=115(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=214(y1), r7=136(x2), r8=28(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=268(x), r11=53(y), r12=25(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 148
LDI r2, 115
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 214
LDI r7, 136
LDI r8, 28
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 53
LDI r12, 25
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
