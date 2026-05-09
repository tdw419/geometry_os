; DESCRIPTION: Composite: Renders a white box of size 66x11 starting at (237, 84) then Renders a blue line between points (232, 237) and (337, 158) then Creates a blue circular shape at (327, 193) with radius 61.
; PLAN: r0=237(x), r1=84(y), r2=66(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=237(y1), r7=337(x2), r8=158(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=193(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 237
LDI r1, 84
LDI r2, 66
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 237
LDI r7, 337
LDI r8, 158
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 193
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
