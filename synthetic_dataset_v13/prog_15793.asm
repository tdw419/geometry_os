; DESCRIPTION: Composite: Places a blue line segment connecting (165, 94) to (128, 133) then Draws a magenta rectangle at (112, 78) with width 87 and height 34 then Creates a blue circular shape at (345, 171) with radius 45.
; PLAN: r0=165(x1), r1=94(y1), r2=128(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=78(y), r7=87(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=345(x), r11=171(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 94
LDI r2, 128
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 78
LDI r7, 87
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 171
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
