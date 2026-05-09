; DESCRIPTION: Composite: Places a magenta line segment connecting (377, 130) to (451, 239) then Places a blue circle of radius 40 at center (220, 139) then Draws a blue rectangle at (283, 151) with width 79 and height 95.
; PLAN: r0=377(x1), r1=130(y1), r2=451(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=139(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=151(y), r12=79(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 130
LDI r2, 451
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 139
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 151
LDI r12, 79
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
