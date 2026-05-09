; DESCRIPTION: Composite: Creates a yellow rectangular region at (172, 90) spanning 26 by 120 pixels then Draws a magenta circle centered at (49, 54) with radius 16 then Places a yellow line segment connecting (256, 169) to (157, 212).
; PLAN: r0=172(x), r1=90(y), r2=26(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=54(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x1), r11=169(y1), r12=157(x2), r13=212(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 90
LDI r2, 26
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 54
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 169
LDI r12, 157
LDI r13, 212
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
