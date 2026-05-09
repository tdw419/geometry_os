; DESCRIPTION: Composite: Draws a red circle centered at (316, 69) with radius 30 then Draws a magenta rectangle at (216, 158) with width 69 and height 97 then Renders a magenta line between points (116, 222) and (394, 248).
; PLAN: r0=316(x), r1=69(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=158(y), r7=69(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=116(x1), r11=222(y1), r12=394(x2), r13=248(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 69
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 158
LDI r7, 69
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 222
LDI r12, 394
LDI r13, 248
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
