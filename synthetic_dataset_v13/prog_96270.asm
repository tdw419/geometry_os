; DESCRIPTION: Composite: Places a blue line segment connecting (347, 106) to (481, 217) then Places a magenta circle of radius 73 at center (277, 75) then Draws a purple rectangle at (332, 113) with width 96 and height 61.
; PLAN: r0=347(x1), r1=106(y1), r2=481(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=75(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=113(y), r12=96(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 106
LDI r2, 481
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 75
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 113
LDI r12, 96
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
