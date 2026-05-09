; DESCRIPTION: Composite: Places a black line segment connecting (72, 65) to (162, 123) then Creates a orange circular shape at (251, 87) with radius 59.
; PLAN: r0=72(x1), r1=65(y1), r2=162(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=87(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 65
LDI r2, 162
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 87
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
