; DESCRIPTION: Composite: Renders a magenta disk with center (170, 169) and radius 27 then Draws a magenta rectangle at (410, 159) with width 41 and height 74 then Draws a purple line from (41, 17) to (466, 134).
; PLAN: r0=170(x), r1=169(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=159(y), r7=41(width), r8=74(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=41(x1), r11=17(y1), r12=466(x2), r13=134(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 169
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 159
LDI r7, 41
LDI r8, 74
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 17
LDI r12, 466
LDI r13, 134
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
