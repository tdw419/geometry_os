; DESCRIPTION: Composite: Places a white line segment connecting (318, 218) to (112, 156) then Creates a orange circular shape at (362, 157) with radius 72.
; PLAN: r0=318(x1), r1=218(y1), r2=112(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=157(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 218
LDI r2, 112
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 157
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
