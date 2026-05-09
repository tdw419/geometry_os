; DESCRIPTION: Composite: Renders a purple box of size 52x75 starting at (119, 179) then Renders a white line between points (132, 40) and (455, 216) then Places a blue circle of radius 72 at center (183, 102).
; PLAN: r0=119(x), r1=179(y), r2=52(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=40(y1), r7=455(x2), r8=216(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=102(y), r12=72(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 179
LDI r2, 52
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 40
LDI r7, 455
LDI r8, 216
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 102
LDI r12, 72
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
