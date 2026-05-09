; DESCRIPTION: Composite: Places a black line segment connecting (496, 253) to (38, 24) then Places a orange circle of radius 47 at center (111, 154) then Creates a black rectangular region at (34, 57) spanning 22 by 58 pixels.
; PLAN: r0=496(x1), r1=253(y1), r2=38(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=154(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x), r11=57(y), r12=22(width), r13=58(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 253
LDI r2, 38
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 154
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 57
LDI r12, 22
LDI r13, 58
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
