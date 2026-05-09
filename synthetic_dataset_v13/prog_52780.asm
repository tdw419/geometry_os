; DESCRIPTION: Composite: Places a red circle of radius 20 at center (208, 157) then Draws a magenta line from (396, 169) to (247, 216) then Draws a purple rectangle at (346, 20) with width 110 and height 33.
; PLAN: r0=208(x), r1=157(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=169(y1), r7=247(x2), r8=216(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=346(x), r11=20(y), r12=110(width), r13=33(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 157
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 169
LDI r7, 247
LDI r8, 216
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 20
LDI r12, 110
LDI r13, 33
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
