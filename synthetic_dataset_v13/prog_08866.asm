; DESCRIPTION: Composite: Draws a black rectangle at (66, 158) with width 26 and height 29 then Draws a yellow circle centered at (221, 103) with radius 46 then Renders a purple line between points (286, 123) and (403, 153).
; PLAN: r0=66(x), r1=158(y), r2=26(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=103(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x1), r11=123(y1), r12=403(x2), r13=153(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 158
LDI r2, 26
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 103
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 123
LDI r12, 403
LDI r13, 153
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
