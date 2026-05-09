; DESCRIPTION: Composite: Renders a yellow box of size 60x65 starting at (396, 149) then Draws a green line from (339, 134) to (34, 179) then Creates a blue circular shape at (104, 92) with radius 75.
; PLAN: r0=396(x), r1=149(y), r2=60(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x1), r6=134(y1), r7=34(x2), r8=179(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=92(y), r12=75(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 149
LDI r2, 60
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 134
LDI r7, 34
LDI r8, 179
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 92
LDI r12, 75
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
