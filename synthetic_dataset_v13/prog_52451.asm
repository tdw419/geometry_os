; DESCRIPTION: Composite: Renders a orange disk with center (234, 81) and radius 54 then Draws a green rectangle at (8, 3) with width 80 and height 84 then Places a purple line segment connecting (366, 166) to (464, 71).
; PLAN: r0=234(x), r1=81(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=3(y), r7=80(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=366(x1), r11=166(y1), r12=464(x2), r13=71(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 81
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 3
LDI r7, 80
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 166
LDI r12, 464
LDI r13, 71
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
