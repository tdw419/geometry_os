; DESCRIPTION: Composite: Renders a purple line between points (342, 11) and (402, 148) then Renders a magenta box of size 16x21 starting at (72, 20) then Draws a green circle centered at (389, 206) with radius 31.
; PLAN: r0=342(x1), r1=11(y1), r2=402(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=20(y), r7=16(width), r8=21(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=389(x), r11=206(y), r12=31(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 11
LDI r2, 402
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 20
LDI r7, 16
LDI r8, 21
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 206
LDI r12, 31
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
