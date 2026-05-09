; DESCRIPTION: Composite: Sets a single green pixel at (94, 39) then Draws a yellow line from (363, 14) to (486, 145) then Renders a orange disk with center (209, 156) and radius 77.
; PLAN: r0=94(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=363(x1), r6=14(y1), r7=486(x2), r8=145(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=156(y), r12=77(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 363
LDI r6, 14
LDI r7, 486
LDI r8, 145
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 156
LDI r12, 77
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
