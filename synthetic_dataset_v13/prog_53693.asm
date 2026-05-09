; DESCRIPTION: Composite: Draws a yellow rectangle at (427, 110) with width 44 and height 69 then Places a red line segment connecting (280, 253) to (499, 195) then Draws a green circle centered at (416, 91) with radius 64.
; PLAN: r0=427(x), r1=110(y), r2=44(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=253(y1), r7=499(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=91(y), r12=64(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 427
LDI r1, 110
LDI r2, 44
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 253
LDI r7, 499
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 91
LDI r12, 64
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
