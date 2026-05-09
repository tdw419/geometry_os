; DESCRIPTION: Composite: Places a white line segment connecting (325, 205) to (201, 143) then Creates a black rectangular region at (343, 97) spanning 100 by 65 pixels.
; PLAN: r0=325(x1), r1=205(y1), r2=201(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=97(y), r7=100(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 205
LDI r2, 201
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 97
LDI r7, 100
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
