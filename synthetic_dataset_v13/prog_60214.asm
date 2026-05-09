; DESCRIPTION: Composite: Renders a black line between points (147, 222) and (57, 179) then Renders a white box of size 83x69 starting at (200, 39) then Creates a orange circular shape at (105, 69) with radius 18.
; PLAN: r0=147(x1), r1=222(y1), r2=57(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=39(y), r7=83(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x), r11=69(y), r12=18(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 222
LDI r2, 57
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 39
LDI r7, 83
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 69
LDI r12, 18
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
