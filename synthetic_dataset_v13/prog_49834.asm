; DESCRIPTION: Composite: Places a red line segment connecting (201, 246) to (167, 240) then Places a yellow circle of radius 74 at center (411, 168) then Creates a magenta rectangular region at (408, 97) spanning 43 by 23 pixels.
; PLAN: r0=201(x1), r1=246(y1), r2=167(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=168(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=97(y), r12=43(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 246
LDI r2, 167
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 168
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 97
LDI r12, 43
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
