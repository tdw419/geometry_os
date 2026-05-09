; DESCRIPTION: Composite: Draws a magenta circle centered at (153, 198) with radius 49 then Draws a red line from (386, 167) to (108, 88) then Creates a green rectangular region at (191, 33) spanning 11 by 49 pixels.
; PLAN: r0=153(x), r1=198(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x1), r6=167(y1), r7=108(x2), r8=88(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=33(y), r12=11(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 198
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 167
LDI r7, 108
LDI r8, 88
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 33
LDI r12, 11
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
