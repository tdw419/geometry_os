; DESCRIPTION: Composite: Sets a single red pixel at (169, 254) then Places a red line segment connecting (85, 156) to (259, 74) then Places a white circle of radius 14 at center (227, 234).
; PLAN: r0=169(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=156(y1), r7=259(x2), r8=74(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=234(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 85
LDI r6, 156
LDI r7, 259
LDI r8, 74
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 234
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
