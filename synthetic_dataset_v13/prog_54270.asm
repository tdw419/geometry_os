; DESCRIPTION: Composite: Renders a orange line between points (267, 28) and (368, 106) then Renders a yellow disk with center (409, 61) and radius 35 then Draws a green rectangle at (282, 128) with width 17 and height 114.
; PLAN: r0=267(x1), r1=28(y1), r2=368(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=61(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x), r11=128(y), r12=17(width), r13=114(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 28
LDI r2, 368
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 61
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 128
LDI r12, 17
LDI r13, 114
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
