; DESCRIPTION: Composite: Sets a single blue pixel at (143, 248) then Draws a red line from (185, 252) to (272, 20) then Places a orange circle of radius 47 at center (285, 119).
; PLAN: r0=143(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=252(y1), r7=272(x2), r8=20(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=119(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 252
LDI r7, 272
LDI r8, 20
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 119
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
