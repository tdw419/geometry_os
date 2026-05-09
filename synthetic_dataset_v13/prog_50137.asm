; DESCRIPTION: Composite: Renders a green box of size 31x66 starting at (227, 35) then Draws a white line from (207, 158) to (245, 120) then Draws a yellow circle centered at (222, 165) with radius 23.
; PLAN: r0=227(x), r1=35(y), r2=31(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=158(y1), r7=245(x2), r8=120(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=165(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 35
LDI r2, 31
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 158
LDI r7, 245
LDI r8, 120
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 165
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
