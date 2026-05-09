; DESCRIPTION: Composite: Sets a single orange pixel at (30, 121) then Draws a purple line from (233, 77) to (116, 214) then Creates a orange circular shape at (187, 154) with radius 66.
; PLAN: r0=30(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=233(x1), r6=77(y1), r7=116(x2), r8=214(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=154(y), r12=66(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 233
LDI r6, 77
LDI r7, 116
LDI r8, 214
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 154
LDI r12, 66
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
