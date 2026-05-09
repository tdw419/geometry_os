; DESCRIPTION: Composite: Draws a black rectangle at (215, 49) with width 37 and height 35 then Draws a blue circle centered at (204, 198) with radius 47 then Places a blue line segment connecting (331, 209) to (311, 86).
; PLAN: r0=215(x), r1=49(y), r2=37(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=198(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=331(x1), r11=209(y1), r12=311(x2), r13=86(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 49
LDI r2, 37
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 198
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 331
LDI r11, 209
LDI r12, 311
LDI r13, 86
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
