; DESCRIPTION: Composite: Renders a magenta line between points (88, 13) and (285, 171) then Draws a purple circle centered at (226, 182) with radius 70 then Creates a purple rectangular region at (168, 60) spanning 105 by 63 pixels.
; PLAN: r0=88(x1), r1=13(y1), r2=285(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=182(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=168(x), r11=60(y), r12=105(width), r13=63(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 13
LDI r2, 285
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 182
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 168
LDI r11, 60
LDI r12, 105
LDI r13, 63
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
