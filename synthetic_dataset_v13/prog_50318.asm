; DESCRIPTION: Composite: Places a orange line segment connecting (144, 122) to (26, 185) then Creates a yellow circular shape at (211, 156) with radius 75.
; PLAN: r0=144(x1), r1=122(y1), r2=26(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=156(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 122
LDI r2, 26
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 156
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
