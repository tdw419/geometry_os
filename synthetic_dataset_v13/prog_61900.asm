; DESCRIPTION: Composite: Renders a magenta box of size 103x15 starting at (232, 38) then Creates a orange circular shape at (53, 203) with radius 44 then Draws a magenta line from (19, 227) to (306, 129).
; PLAN: r0=232(x), r1=38(y), r2=103(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=203(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x1), r11=227(y1), r12=306(x2), r13=129(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 38
LDI r2, 103
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 203
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 227
LDI r12, 306
LDI r13, 129
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
