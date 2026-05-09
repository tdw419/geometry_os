; DESCRIPTION: Composite: Places a orange dot at position (73, 142) then Places a orange line segment connecting (14, 179) to (506, 124) then Creates a white circular shape at (85, 154) with radius 72.
; PLAN: r0=73(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=179(y1), r7=506(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=154(y), r12=72(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 14
LDI r6, 179
LDI r7, 506
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 154
LDI r12, 72
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
