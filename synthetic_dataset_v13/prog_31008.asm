; DESCRIPTION: Composite: Creates a blue rectangular region at (311, 160) spanning 67 by 88 pixels then Renders a magenta disk with center (75, 175) and radius 68 then Places a white line segment connecting (500, 199) to (286, 191).
; PLAN: r0=311(x), r1=160(y), r2=67(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=175(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=199(y1), r12=286(x2), r13=191(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 160
LDI r2, 67
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 175
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 199
LDI r12, 286
LDI r13, 191
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
