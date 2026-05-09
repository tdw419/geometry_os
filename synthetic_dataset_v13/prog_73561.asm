; DESCRIPTION: Composite: Renders a yellow box of size 77x92 starting at (395, 96) then Draws a blue circle centered at (440, 214) with radius 40 then Places a purple line segment connecting (408, 14) to (431, 122).
; PLAN: r0=395(x), r1=96(y), r2=77(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=214(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x1), r11=14(y1), r12=431(x2), r13=122(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 96
LDI r2, 77
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 214
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 14
LDI r12, 431
LDI r13, 122
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
