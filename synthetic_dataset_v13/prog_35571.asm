; DESCRIPTION: Composite: Places a green line segment connecting (430, 222) to (382, 58) then Draws a magenta rectangle at (396, 187) with width 35 and height 17 then Places a blue circle of radius 69 at center (333, 112).
; PLAN: r0=430(x1), r1=222(y1), r2=382(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=187(y), r7=35(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x), r11=112(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 222
LDI r2, 382
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 187
LDI r7, 35
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 112
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
