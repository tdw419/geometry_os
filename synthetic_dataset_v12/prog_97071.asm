; DESCRIPTION: Composite: Places a purple circle of radius 80 at center (120, 151) then Draws a blue line from (349, 120) to (400, 200) then Creates a yellow rectangular region at (407, 78) spanning 58 by 55 pixels.
; PLAN: r0=120(x), r1=151(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=120(y1), r7=400(x2), r8=200(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=78(y), r12=58(width), r13=55(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 151
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 120
LDI r7, 400
LDI r8, 200
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 78
LDI r12, 58
LDI r13, 55
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
