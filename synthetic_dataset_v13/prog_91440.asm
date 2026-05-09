; DESCRIPTION: Composite: Places a red circle of radius 13 at center (210, 78) then Draws a green rectangle at (309, 155) with width 119 and height 57 then Places a purple line segment connecting (375, 240) to (70, 121).
; PLAN: r0=210(x), r1=78(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=155(y), r7=119(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x1), r11=240(y1), r12=70(x2), r13=121(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 78
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 155
LDI r7, 119
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 240
LDI r12, 70
LDI r13, 121
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
