; DESCRIPTION: Composite: Renders a white box of size 34x22 starting at (189, 160) then Renders a orange line between points (224, 112) and (268, 17) then Creates a green circular shape at (115, 120) with radius 14.
; PLAN: r0=189(x), r1=160(y), r2=34(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=112(y1), r7=268(x2), r8=17(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=120(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 160
LDI r2, 34
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 112
LDI r7, 268
LDI r8, 17
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 120
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
