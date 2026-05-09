; DESCRIPTION: Composite: Draws a yellow rectangle at (350, 163) with width 53 and height 20 then Draws a blue circle centered at (197, 90) with radius 29 then Draws a yellow line from (370, 227) to (100, 57).
; PLAN: r0=350(x), r1=163(y), r2=53(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=90(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x1), r11=227(y1), r12=100(x2), r13=57(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 163
LDI r2, 53
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 90
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 227
LDI r12, 100
LDI r13, 57
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
