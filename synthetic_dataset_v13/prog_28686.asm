; DESCRIPTION: Composite: Places a red line segment connecting (403, 179) to (59, 142) then Draws a red circle centered at (87, 55) with radius 30 then Creates a purple rectangular region at (430, 185) spanning 62 by 71 pixels.
; PLAN: r0=403(x1), r1=179(y1), r2=59(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=55(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=185(y), r12=62(width), r13=71(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 179
LDI r2, 59
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 55
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 185
LDI r12, 62
LDI r13, 71
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
