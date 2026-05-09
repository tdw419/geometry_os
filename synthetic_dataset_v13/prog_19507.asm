; DESCRIPTION: Composite: Places a blue dot at position (149, 141) then Renders a black line between points (364, 248) and (349, 212) then Creates a magenta circular shape at (187, 131) with radius 58.
; PLAN: r0=149(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=248(y1), r7=349(x2), r8=212(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=131(y), r12=58(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 248
LDI r7, 349
LDI r8, 212
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 131
LDI r12, 58
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
