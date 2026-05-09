; DESCRIPTION: Composite: Creates a yellow circular shape at (79, 136) with radius 78 then Renders a yellow box of size 91x79 starting at (357, 55) then Draws a purple line from (141, 29) to (285, 44).
; PLAN: r0=79(x), r1=136(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=55(y), r7=91(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x1), r11=29(y1), r12=285(x2), r13=44(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 136
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 55
LDI r7, 91
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 29
LDI r12, 285
LDI r13, 44
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
