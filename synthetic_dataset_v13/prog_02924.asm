; DESCRIPTION: Composite: Places a green dot at position (395, 14) then Draws a black line from (200, 179) to (227, 114) then Draws a red circle centered at (187, 119) with radius 49.
; PLAN: r0=395(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=200(x1), r6=179(y1), r7=227(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=119(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 179
LDI r7, 227
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 119
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
