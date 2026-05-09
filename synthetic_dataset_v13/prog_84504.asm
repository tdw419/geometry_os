; DESCRIPTION: Composite: Draws a magenta line from (13, 232) to (451, 153) then Renders a blue box of size 109x56 starting at (20, 68) then Creates a orange circular shape at (398, 225) with radius 22.
; PLAN: r0=13(x1), r1=232(y1), r2=451(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=68(y), r7=109(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=225(y), r12=22(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 13
LDI r1, 232
LDI r2, 451
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 68
LDI r7, 109
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 225
LDI r12, 22
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
