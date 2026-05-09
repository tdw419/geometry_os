; DESCRIPTION: Composite: Places a yellow line segment connecting (50, 154) to (14, 251) then Creates a black circular shape at (304, 130) with radius 10 then Creates a green rectangular region at (72, 202) spanning 28 by 10 pixels.
; PLAN: r0=50(x1), r1=154(y1), r2=14(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=130(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=202(y), r12=28(width), r13=10(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 154
LDI r2, 14
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 130
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 202
LDI r12, 28
LDI r13, 10
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
