; DESCRIPTION: Composite: Renders a black line between points (236, 67) and (223, 171) then Draws a yellow circle centered at (440, 201) with radius 53 then Draws a black rectangle at (153, 28) with width 106 and height 20.
; PLAN: r0=236(x1), r1=67(y1), r2=223(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=201(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=28(y), r12=106(width), r13=20(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 67
LDI r2, 223
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 201
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 28
LDI r12, 106
LDI r13, 20
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
