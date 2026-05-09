; DESCRIPTION: Composite: Places a magenta circle of radius 56 at center (85, 101) then Creates a magenta rectangular region at (62, 91) spanning 31 by 35 pixels then Places a blue line segment connecting (451, 33) to (190, 92).
; PLAN: r0=85(x), r1=101(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x), r6=91(y), r7=31(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=33(y1), r12=190(x2), r13=92(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 101
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 91
LDI r7, 31
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 33
LDI r12, 190
LDI r13, 92
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
