; DESCRIPTION: Composite: Creates a green rectangular region at (386, 58) spanning 119 by 57 pixels then Draws a magenta circle centered at (208, 174) with radius 16 then Draws a yellow line from (472, 155) to (130, 31).
; PLAN: r0=386(x), r1=58(y), r2=119(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=174(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x1), r11=155(y1), r12=130(x2), r13=31(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 58
LDI r2, 119
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 174
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 155
LDI r12, 130
LDI r13, 31
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
