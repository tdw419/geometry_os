; DESCRIPTION: Composite: Places a yellow dot at position (475, 147) then Renders a red line between points (359, 120) and (143, 2) then Renders a black disk with center (301, 56) and radius 38.
; PLAN: r0=475(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=359(x1), r6=120(y1), r7=143(x2), r8=2(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=56(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 147
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 359
LDI r6, 120
LDI r7, 143
LDI r8, 2
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 56
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
