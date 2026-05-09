; DESCRIPTION: Composite: Creates a blue rectangular region at (376, 105) spanning 111 by 86 pixels then Creates a yellow circular shape at (403, 171) with radius 65 then Draws a orange line from (237, 70) to (326, 231).
; PLAN: r0=376(x), r1=105(y), r2=111(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=171(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x1), r11=70(y1), r12=326(x2), r13=231(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 105
LDI r2, 111
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 171
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 70
LDI r12, 326
LDI r13, 231
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
