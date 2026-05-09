; DESCRIPTION: Composite: Draws a orange circle centered at (299, 142) with radius 71 then Creates a green rectangular region at (8, 155) spanning 70 by 69 pixels then Draws a purple line from (219, 50) to (129, 241).
; PLAN: r0=299(x), r1=142(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=155(y), r7=70(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x1), r11=50(y1), r12=129(x2), r13=241(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 142
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 155
LDI r7, 70
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 50
LDI r12, 129
LDI r13, 241
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
