; DESCRIPTION: Composite: Draws a magenta circle centered at (304, 166) with radius 58 then Draws a black rectangle at (393, 176) with width 100 and height 12 then Places a red line segment connecting (261, 157) to (423, 86).
; PLAN: r0=304(x), r1=166(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=176(y), r7=100(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x1), r11=157(y1), r12=423(x2), r13=86(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 166
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 176
LDI r7, 100
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 157
LDI r12, 423
LDI r13, 86
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
