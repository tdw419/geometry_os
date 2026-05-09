; DESCRIPTION: Composite: Draws a yellow rectangle at (297, 134) with width 30 and height 105 then Places a green circle of radius 71 at center (102, 88) then Places a magenta line segment connecting (447, 240) to (41, 244).
; PLAN: r0=297(x), r1=134(y), r2=30(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=88(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x1), r11=240(y1), r12=41(x2), r13=244(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 134
LDI r2, 30
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 88
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 240
LDI r12, 41
LDI r13, 244
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
