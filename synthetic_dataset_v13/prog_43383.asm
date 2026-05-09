; DESCRIPTION: Composite: Sets a single red pixel at (15, 62) then Renders a yellow line between points (474, 114) and (118, 227) then Draws a black circle centered at (192, 166) with radius 76.
; PLAN: r0=15(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=114(y1), r7=118(x2), r8=227(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=166(y), r12=76(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 474
LDI r6, 114
LDI r7, 118
LDI r8, 227
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 166
LDI r12, 76
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
