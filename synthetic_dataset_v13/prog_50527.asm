; DESCRIPTION: Composite: Draws a green rectangle at (247, 119) with width 42 and height 10 then Draws a magenta circle centered at (160, 124) with radius 22 then Draws a green line from (344, 5) to (359, 58).
; PLAN: r0=247(x), r1=119(y), r2=42(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=124(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x1), r11=5(y1), r12=359(x2), r13=58(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 119
LDI r2, 42
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 124
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 5
LDI r12, 359
LDI r13, 58
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
