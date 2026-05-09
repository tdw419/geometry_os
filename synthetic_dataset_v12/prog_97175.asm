; DESCRIPTION: Composite: Creates a black rectangular region at (454, 33) spanning 25 by 87 pixels then Places a red circle of radius 44 at center (86, 156) then Places a black line segment connecting (58, 137) to (11, 28).
; PLAN: r0=454(x), r1=33(y), r2=25(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=156(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x1), r11=137(y1), r12=11(x2), r13=28(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 33
LDI r2, 25
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 156
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 137
LDI r12, 11
LDI r13, 28
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
