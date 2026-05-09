; DESCRIPTION: Composite: Places a yellow line segment connecting (439, 139) to (324, 202) then Draws a red circle centered at (476, 155) with radius 21 then Draws a white rectangle at (246, 149) with width 16 and height 100.
; PLAN: r0=439(x1), r1=139(y1), r2=324(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=155(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=246(x), r11=149(y), r12=16(width), r13=100(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 139
LDI r2, 324
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 155
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 246
LDI r11, 149
LDI r12, 16
LDI r13, 100
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
