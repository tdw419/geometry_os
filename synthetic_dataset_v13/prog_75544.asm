; DESCRIPTION: Composite: Renders a green disk with center (250, 133) and radius 78 then Places a yellow line segment connecting (28, 38) to (137, 85) then Creates a magenta rectangular region at (165, 161) spanning 101 by 84 pixels.
; PLAN: r0=250(x), r1=133(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x1), r6=38(y1), r7=137(x2), r8=85(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=161(y), r12=101(width), r13=84(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 133
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 38
LDI r7, 137
LDI r8, 85
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 161
LDI r12, 101
LDI r13, 84
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
