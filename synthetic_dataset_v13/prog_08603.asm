; DESCRIPTION: Composite: Renders a black line between points (23, 201) and (384, 75) then Creates a orange circular shape at (107, 163) with radius 13 then Creates a red rectangular region at (274, 105) spanning 107 by 103 pixels.
; PLAN: r0=23(x1), r1=201(y1), r2=384(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=163(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x), r11=105(y), r12=107(width), r13=103(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 201
LDI r2, 384
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 163
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 105
LDI r12, 107
LDI r13, 103
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
