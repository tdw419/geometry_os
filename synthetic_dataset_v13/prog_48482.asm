; DESCRIPTION: Composite: Creates a green rectangular region at (197, 135) spanning 112 by 78 pixels then Draws a blue circle centered at (172, 73) with radius 70 then Draws a magenta line from (304, 231) to (220, 4).
; PLAN: r0=197(x), r1=135(y), r2=112(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=73(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x1), r11=231(y1), r12=220(x2), r13=4(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 135
LDI r2, 112
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 73
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 231
LDI r12, 220
LDI r13, 4
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
