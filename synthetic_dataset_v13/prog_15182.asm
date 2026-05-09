; DESCRIPTION: Composite: Places a black line segment connecting (440, 24) to (391, 116) then Draws a orange circle centered at (371, 67) with radius 30 then Creates a green rectangular region at (248, 123) spanning 91 by 98 pixels.
; PLAN: r0=440(x1), r1=24(y1), r2=391(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=67(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=123(y), r12=91(width), r13=98(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 24
LDI r2, 391
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 67
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 123
LDI r12, 91
LDI r13, 98
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
