; DESCRIPTION: Composite: Places a yellow dot at position (216, 194) then Renders a red line between points (30, 3) and (407, 195) then Creates a black circular shape at (194, 71) with radius 44.
; PLAN: r0=216(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=3(y1), r7=407(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=71(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 30
LDI r6, 3
LDI r7, 407
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 71
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
