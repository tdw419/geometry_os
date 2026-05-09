; DESCRIPTION: Composite: Places a orange dot at position (85, 81) then Places a red line segment connecting (184, 203) to (339, 169) then Creates a white circular shape at (271, 184) with radius 20.
; PLAN: r0=85(x), r1=81(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=203(y1), r7=339(x2), r8=169(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=184(y), r12=20(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 81
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 184
LDI r6, 203
LDI r7, 339
LDI r8, 169
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 184
LDI r12, 20
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
