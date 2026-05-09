; DESCRIPTION: Composite: Draws a red line from (406, 188) to (287, 249) then Draws a black circle centered at (244, 111) with radius 54 then Renders a magenta box of size 13x104 starting at (369, 105).
; PLAN: r0=406(x1), r1=188(y1), r2=287(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=111(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x), r11=105(y), r12=13(width), r13=104(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 188
LDI r2, 287
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 111
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 105
LDI r12, 13
LDI r13, 104
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
