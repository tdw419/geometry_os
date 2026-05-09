; DESCRIPTION: Composite: Places a magenta line segment connecting (91, 225) to (476, 252) then Draws a purple circle centered at (164, 160) with radius 37 then Renders a green box of size 10x17 starting at (6, 9).
; PLAN: r0=91(x1), r1=225(y1), r2=476(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=160(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=9(y), r12=10(width), r13=17(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 225
LDI r2, 476
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 160
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 9
LDI r12, 10
LDI r13, 17
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
