; DESCRIPTION: Composite: Draws a magenta line from (148, 29) to (470, 45) then Creates a black circular shape at (406, 78) with radius 35 then Creates a red rectangular region at (118, 55) spanning 102 by 103 pixels.
; PLAN: r0=148(x1), r1=29(y1), r2=470(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=78(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=55(y), r12=102(width), r13=103(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 29
LDI r2, 470
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 78
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 55
LDI r12, 102
LDI r13, 103
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
