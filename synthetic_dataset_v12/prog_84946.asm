; DESCRIPTION: Composite: Draws a blue line from (244, 6) to (22, 154) then Draws a red circle centered at (438, 177) with radius 55 then Draws a orange rectangle at (11, 37) with width 97 and height 97.
; PLAN: r0=244(x1), r1=6(y1), r2=22(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=177(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=37(y), r12=97(width), r13=97(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 6
LDI r2, 22
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 177
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 37
LDI r12, 97
LDI r13, 97
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
