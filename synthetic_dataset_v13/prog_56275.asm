; DESCRIPTION: Composite: Renders a green box of size 88x19 starting at (122, 156) then Creates a white circular shape at (94, 174) with radius 73 then Renders a purple line between points (43, 131) and (321, 144).
; PLAN: r0=122(x), r1=156(y), r2=88(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=174(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x1), r11=131(y1), r12=321(x2), r13=144(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 156
LDI r2, 88
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 174
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 131
LDI r12, 321
LDI r13, 144
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
