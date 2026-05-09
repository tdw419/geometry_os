; DESCRIPTION: Composite: Sets a single blue pixel at (171, 38) then Renders a red line between points (7, 147) and (443, 175) then Draws a yellow circle centered at (126, 106) with radius 59.
; PLAN: r0=171(x), r1=38(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=147(y1), r7=443(x2), r8=175(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=106(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 38
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 147
LDI r7, 443
LDI r8, 175
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 106
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
