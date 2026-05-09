; DESCRIPTION: Composite: Draws a orange line from (121, 206) to (405, 167) then Renders a red disk with center (316, 56) and radius 23 then Draws a yellow rectangle at (142, 28) with width 114 and height 39.
; PLAN: r0=121(x1), r1=206(y1), r2=405(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=56(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x), r11=28(y), r12=114(width), r13=39(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 206
LDI r2, 405
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 56
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 28
LDI r12, 114
LDI r13, 39
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
