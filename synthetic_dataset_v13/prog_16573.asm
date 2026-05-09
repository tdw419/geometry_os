; DESCRIPTION: Composite: Draws a green rectangle at (197, 62) with width 92 and height 104 then Places a yellow line segment connecting (201, 214) to (135, 220) then Renders a blue disk with center (455, 61) and radius 45.
; PLAN: r0=197(x), r1=62(y), r2=92(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=214(y1), r7=135(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=455(x), r11=61(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 62
LDI r2, 92
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 214
LDI r7, 135
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 61
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
