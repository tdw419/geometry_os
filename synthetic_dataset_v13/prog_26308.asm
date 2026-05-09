; DESCRIPTION: Composite: Places a blue line segment connecting (489, 85) to (240, 91) then Places a white circle of radius 58 at center (240, 64) then Draws a green rectangle at (0, 174) with width 79 and height 80.
; PLAN: r0=489(x1), r1=85(y1), r2=240(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=64(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=174(y), r12=79(width), r13=80(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 85
LDI r2, 240
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 64
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 174
LDI r12, 79
LDI r13, 80
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
