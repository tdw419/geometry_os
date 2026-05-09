; DESCRIPTION: Composite: Places a magenta line segment connecting (37, 7) to (204, 183) then Places a red circle of radius 16 at center (68, 229) then Draws a purple rectangle at (329, 29) with width 23 and height 69.
; PLAN: r0=37(x1), r1=7(y1), r2=204(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=229(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=329(x), r11=29(y), r12=23(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 7
LDI r2, 204
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 229
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 329
LDI r11, 29
LDI r12, 23
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
