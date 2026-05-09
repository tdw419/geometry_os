; DESCRIPTION: Composite: Renders a blue box of size 74x66 starting at (30, 71) then Draws a blue circle centered at (427, 99) with radius 46 then Renders a blue line between points (22, 10) and (137, 116).
; PLAN: r0=30(x), r1=71(y), r2=74(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=99(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x1), r11=10(y1), r12=137(x2), r13=116(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 71
LDI r2, 74
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 99
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 10
LDI r12, 137
LDI r13, 116
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
