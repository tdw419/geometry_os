; DESCRIPTION: Composite: Places a magenta line segment connecting (203, 175) to (142, 93) then Renders a purple disk with center (376, 103) and radius 15 then Draws a blue rectangle at (114, 202) with width 99 and height 45.
; PLAN: r0=203(x1), r1=175(y1), r2=142(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=103(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=114(x), r11=202(y), r12=99(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 175
LDI r2, 142
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 103
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 114
LDI r11, 202
LDI r12, 99
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
