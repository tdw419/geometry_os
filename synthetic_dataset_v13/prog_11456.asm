; DESCRIPTION: Composite: Places a red dot at position (47, 223) then Draws a yellow line from (456, 171) to (472, 105) then Creates a black circular shape at (88, 190) with radius 49.
; PLAN: r0=47(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=456(x1), r6=171(y1), r7=472(x2), r8=105(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=190(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 456
LDI r6, 171
LDI r7, 472
LDI r8, 105
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 190
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
