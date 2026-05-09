; DESCRIPTION: Composite: Renders a green line between points (413, 118) and (208, 217) then Places a yellow circle of radius 67 at center (327, 103) then Creates a purple rectangular region at (318, 186) spanning 13 by 40 pixels.
; PLAN: r0=413(x1), r1=118(y1), r2=208(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=103(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=186(y), r12=13(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 118
LDI r2, 208
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 103
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 186
LDI r12, 13
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
