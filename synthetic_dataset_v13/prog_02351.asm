; DESCRIPTION: Composite: Draws a blue circle centered at (327, 94) with radius 62 then Draws a purple rectangle at (33, 98) with width 86 and height 81 then Places a black line segment connecting (201, 216) to (361, 145).
; PLAN: r0=327(x), r1=94(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=98(y), r7=86(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x1), r11=216(y1), r12=361(x2), r13=145(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 94
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 98
LDI r7, 86
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 216
LDI r12, 361
LDI r13, 145
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
