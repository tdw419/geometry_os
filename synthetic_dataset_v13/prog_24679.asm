; DESCRIPTION: Composite: Places a yellow line segment connecting (301, 120) to (34, 85) then Creates a white rectangular region at (189, 55) spanning 81 by 49 pixels then Draws a green circle centered at (57, 154) with radius 18.
; PLAN: r0=301(x1), r1=120(y1), r2=34(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=55(y), r7=81(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x), r11=154(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 120
LDI r2, 34
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 55
LDI r7, 81
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 154
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
