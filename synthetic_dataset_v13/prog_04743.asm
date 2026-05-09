; DESCRIPTION: Composite: Draws a magenta rectangle at (112, 25) with width 33 and height 101 then Places a orange line segment connecting (135, 44) to (209, 117) then Creates a white circular shape at (262, 162) with radius 66.
; PLAN: r0=112(x), r1=25(y), r2=33(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x1), r6=44(y1), r7=209(x2), r8=117(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=162(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 25
LDI r2, 33
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 44
LDI r7, 209
LDI r8, 117
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 162
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
