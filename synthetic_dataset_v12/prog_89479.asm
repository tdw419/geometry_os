; DESCRIPTION: Composite: Renders a blue disk with center (367, 41) and radius 17 then Draws a black rectangle at (140, 137) with width 45 and height 62 then Draws a magenta line from (431, 96) to (358, 115).
; PLAN: r0=367(x), r1=41(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=137(y), r7=45(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x1), r11=96(y1), r12=358(x2), r13=115(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 41
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 137
LDI r7, 45
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 96
LDI r12, 358
LDI r13, 115
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
