; DESCRIPTION: Composite: Places a purple line segment connecting (262, 251) to (357, 225) then Places a green 37x29 rectangle at position (68, 142) then Draws a white circle centered at (197, 173) with radius 49.
; PLAN: r0=262(x1), r1=251(y1), r2=357(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=142(y), r7=37(width), r8=29(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x), r11=173(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 251
LDI r2, 357
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 142
LDI r7, 37
LDI r8, 29
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 173
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
