; DESCRIPTION: Composite: Places a purple line segment connecting (491, 109) to (201, 71) then Places a green 32x37 rectangle at position (470, 198) then Draws a black circle centered at (345, 136) with radius 22.
; PLAN: r0=491(x1), r1=109(y1), r2=201(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=198(y), r7=32(width), r8=37(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=345(x), r11=136(y), r12=22(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 491
LDI r1, 109
LDI r2, 201
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 198
LDI r7, 32
LDI r8, 37
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 136
LDI r12, 22
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
