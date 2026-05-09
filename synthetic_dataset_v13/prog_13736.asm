; DESCRIPTION: Composite: Places a yellow circle of radius 26 at center (461, 170) then Draws a white line from (475, 132) to (442, 233) then Draws a blue rectangle at (216, 126) with width 15 and height 101.
; PLAN: r0=461(x), r1=170(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x1), r6=132(y1), r7=442(x2), r8=233(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=126(y), r12=15(width), r13=101(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 170
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 132
LDI r7, 442
LDI r8, 233
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 126
LDI r12, 15
LDI r13, 101
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
