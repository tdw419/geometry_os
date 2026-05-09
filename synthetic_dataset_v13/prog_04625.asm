; DESCRIPTION: Composite: Draws a orange circle centered at (249, 154) with radius 59 then Creates a black rectangular region at (137, 16) spanning 115 by 13 pixels then Places a magenta line segment connecting (500, 74) to (470, 220).
; PLAN: r0=249(x), r1=154(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=16(y), r7=115(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x1), r11=74(y1), r12=470(x2), r13=220(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 154
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 16
LDI r7, 115
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 74
LDI r12, 470
LDI r13, 220
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
