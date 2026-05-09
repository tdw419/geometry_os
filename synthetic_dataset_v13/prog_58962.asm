; DESCRIPTION: Composite: Draws a green line from (429, 30) to (497, 70) then Draws a yellow rectangle at (236, 109) with width 114 and height 18 then Creates a blue circular shape at (296, 139) with radius 40.
; PLAN: r0=429(x1), r1=30(y1), r2=497(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=109(y), r7=114(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=139(y), r12=40(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 30
LDI r2, 497
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 109
LDI r7, 114
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 139
LDI r12, 40
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
