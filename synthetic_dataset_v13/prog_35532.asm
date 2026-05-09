; DESCRIPTION: Composite: Places a purple line segment connecting (259, 166) to (229, 66) then Creates a magenta circular shape at (123, 46) with radius 13 then Creates a yellow rectangular region at (376, 2) spanning 111 by 114 pixels.
; PLAN: r0=259(x1), r1=166(y1), r2=229(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=46(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=2(y), r12=111(width), r13=114(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 166
LDI r2, 229
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 46
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 2
LDI r12, 111
LDI r13, 114
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
