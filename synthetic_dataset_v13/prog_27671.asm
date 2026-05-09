; DESCRIPTION: Composite: Creates a yellow rectangular region at (357, 177) spanning 101 by 55 pixels then Renders a orange line between points (360, 86) and (457, 193) then Creates a green circular shape at (257, 84) with radius 44.
; PLAN: r0=357(x), r1=177(y), r2=101(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x1), r6=86(y1), r7=457(x2), r8=193(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=84(y), r12=44(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 177
LDI r2, 101
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 86
LDI r7, 457
LDI r8, 193
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 84
LDI r12, 44
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
