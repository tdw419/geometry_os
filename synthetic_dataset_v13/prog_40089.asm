; DESCRIPTION: Composite: Draws a yellow line from (114, 90) to (199, 61) then Creates a green rectangular region at (205, 34) spanning 10 by 62 pixels then Creates a black circular shape at (340, 166) with radius 77.
; PLAN: r0=114(x1), r1=90(y1), r2=199(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=34(y), r7=10(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=166(y), r12=77(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 114
LDI r1, 90
LDI r2, 199
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 34
LDI r7, 10
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 166
LDI r12, 77
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
