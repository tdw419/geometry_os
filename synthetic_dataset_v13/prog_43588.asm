; DESCRIPTION: Composite: Creates a black circular shape at (118, 152) with radius 55 then Creates a blue rectangular region at (75, 102) spanning 120 by 112 pixels then Places a black line segment connecting (451, 60) to (396, 205).
; PLAN: r0=118(x), r1=152(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=102(y), r7=120(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=60(y1), r12=396(x2), r13=205(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 152
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 102
LDI r7, 120
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 60
LDI r12, 396
LDI r13, 205
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
