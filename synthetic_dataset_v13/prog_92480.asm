; DESCRIPTION: Composite: Places a purple line segment connecting (52, 156) to (306, 191) then Places a purple circle of radius 28 at center (300, 179) then Draws a red rectangle at (150, 39) with width 53 and height 23.
; PLAN: r0=52(x1), r1=156(y1), r2=306(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=179(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=150(x), r11=39(y), r12=53(width), r13=23(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 156
LDI r2, 306
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 179
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 150
LDI r11, 39
LDI r12, 53
LDI r13, 23
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
