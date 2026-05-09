; DESCRIPTION: Composite: Draws a black rectangle at (396, 72) with width 116 and height 96 then Draws a white line from (285, 53) to (11, 57) then Creates a purple circular shape at (229, 59) with radius 34.
; PLAN: r0=396(x), r1=72(y), r2=116(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x1), r6=53(y1), r7=11(x2), r8=57(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=59(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 72
LDI r2, 116
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 53
LDI r7, 11
LDI r8, 57
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 59
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
