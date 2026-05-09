; DESCRIPTION: Composite: Draws a red rectangle at (390, 131) with width 112 and height 62 then Places a magenta line segment connecting (98, 208) to (97, 136) then Places a red circle of radius 16 at center (32, 101).
; PLAN: r0=390(x), r1=131(y), r2=112(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=208(y1), r7=97(x2), r8=136(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=101(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 131
LDI r2, 112
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 208
LDI r7, 97
LDI r8, 136
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 101
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
