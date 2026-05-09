; DESCRIPTION: Composite: Renders a white box of size 17x61 starting at (265, 180) then Renders a black line between points (463, 12) and (22, 53) then Draws a yellow circle centered at (414, 211) with radius 15.
; PLAN: r0=265(x), r1=180(y), r2=17(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=12(y1), r7=22(x2), r8=53(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=211(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 180
LDI r2, 17
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 12
LDI r7, 22
LDI r8, 53
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 211
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
