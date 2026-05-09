; DESCRIPTION: Composite: Renders a magenta disk with center (94, 154) and radius 63 then Creates a blue rectangular region at (172, 59) spanning 76 by 21 pixels then Draws a white line from (7, 155) to (293, 131).
; PLAN: r0=94(x), r1=154(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=59(y), r7=76(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=7(x1), r11=155(y1), r12=293(x2), r13=131(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 154
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 59
LDI r7, 76
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 155
LDI r12, 293
LDI r13, 131
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
