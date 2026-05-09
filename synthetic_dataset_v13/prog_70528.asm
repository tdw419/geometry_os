; DESCRIPTION: Composite: Renders a white box of size 30x104 starting at (43, 10) then Draws a black line from (192, 136) to (19, 252) then Creates a magenta circular shape at (154, 115) with radius 71.
; PLAN: r0=43(x), r1=10(y), r2=30(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x1), r6=136(y1), r7=19(x2), r8=252(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=115(y), r12=71(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 10
LDI r2, 30
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 136
LDI r7, 19
LDI r8, 252
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 115
LDI r12, 71
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
