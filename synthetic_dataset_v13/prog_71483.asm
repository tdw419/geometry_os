; DESCRIPTION: Composite: Places a red dot at position (370, 156) then Renders a black line between points (337, 89) and (457, 136) then Renders a orange disk with center (73, 111) and radius 72.
; PLAN: r0=370(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=89(y1), r7=457(x2), r8=136(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=111(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 337
LDI r6, 89
LDI r7, 457
LDI r8, 136
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 111
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
