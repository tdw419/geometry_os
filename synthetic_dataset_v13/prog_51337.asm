; DESCRIPTION: Composite: Renders a black disk with center (318, 169) and radius 60 then Draws a red line from (122, 169) to (127, 104).
; PLAN: r0=318(x), r1=169(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=169(y1), r7=127(x2), r8=104(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 169
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 169
LDI r7, 127
LDI r8, 104
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
