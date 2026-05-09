; DESCRIPTION: Composite: Creates a magenta circular shape at (420, 123) with radius 17 then Places a black line segment connecting (402, 24) to (110, 96) then Creates a yellow rectangular region at (188, 169) spanning 42 by 43 pixels.
; PLAN: r0=420(x), r1=123(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=24(y1), r7=110(x2), r8=96(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=169(y), r12=42(width), r13=43(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 123
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 24
LDI r7, 110
LDI r8, 96
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 169
LDI r12, 42
LDI r13, 43
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
