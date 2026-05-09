; DESCRIPTION: Composite: Places a magenta line segment connecting (408, 200) to (244, 19) then Draws a cyan circle centered at (284, 156) with radius 65 then Renders a purple box of size 33x15 starting at (118, 74).
; PLAN: r0=408(x1), r1=200(y1), r2=244(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=156(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=74(y), r12=33(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 200
LDI r2, 244
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 156
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 74
LDI r12, 33
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
