; DESCRIPTION: Composite: Places a blue line segment connecting (193, 73) to (333, 210) then Creates a green rectangular region at (451, 104) spanning 14 by 51 pixels then Draws a yellow circle centered at (72, 45) with radius 28.
; PLAN: r0=193(x1), r1=73(y1), r2=333(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=104(y), r7=14(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=45(y), r12=28(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 73
LDI r2, 333
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 104
LDI r7, 14
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 45
LDI r12, 28
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
