; DESCRIPTION: Composite: Renders a green line between points (29, 33) and (252, 201) then Creates a blue circular shape at (161, 117) with radius 70 then Creates a magenta rectangular region at (145, 112) spanning 55 by 90 pixels.
; PLAN: r0=29(x1), r1=33(y1), r2=252(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=117(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=112(y), r12=55(width), r13=90(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 33
LDI r2, 252
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 117
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 112
LDI r12, 55
LDI r13, 90
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
