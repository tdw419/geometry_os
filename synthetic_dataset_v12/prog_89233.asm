; DESCRIPTION: Composite: Renders a yellow box of size 109x96 starting at (15, 22) then Renders a orange line between points (99, 9) and (257, 73) then Creates a orange circular shape at (321, 34) with radius 30.
; PLAN: r0=15(x), r1=22(y), r2=109(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x1), r6=9(y1), r7=257(x2), r8=73(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=34(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 22
LDI r2, 109
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 9
LDI r7, 257
LDI r8, 73
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 34
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
