; DESCRIPTION: Composite: Renders a yellow disk with center (344, 88) and radius 49 then Draws a red line from (314, 237) to (28, 138) then Places a black 22x117 rectangle at position (65, 72).
; PLAN: r0=344(x), r1=88(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=237(y1), r7=28(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=72(y), r12=22(width), r13=117(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 88
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 237
LDI r7, 28
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 72
LDI r12, 22
LDI r13, 117
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
