; DESCRIPTION: Composite: Renders a orange line between points (3, 251) and (444, 220) then Renders a red disk with center (232, 95) and radius 77 then Sets a single red pixel at (237, 158).
; PLAN: r0=3(x1), r1=251(y1), r2=444(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=95(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x), r11=158(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 3
LDI r1, 251
LDI r2, 444
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 95
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 158
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
