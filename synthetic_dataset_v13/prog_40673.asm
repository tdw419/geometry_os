; DESCRIPTION: Composite: Creates a blue circular shape at (356, 127) with radius 49 then Draws a yellow rectangle at (133, 130) with width 49 and height 13 then Renders a purple line between points (190, 207) and (105, 95).
; PLAN: r0=356(x), r1=127(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=130(y), r7=49(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=190(x1), r11=207(y1), r12=105(x2), r13=95(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 127
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 130
LDI r7, 49
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 207
LDI r12, 105
LDI r13, 95
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
