; DESCRIPTION: Composite: Places a yellow line segment connecting (33, 250) to (367, 137) then Creates a orange circular shape at (423, 91) with radius 59.
; PLAN: r0=33(x1), r1=250(y1), r2=367(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=91(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 250
LDI r2, 367
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 91
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
