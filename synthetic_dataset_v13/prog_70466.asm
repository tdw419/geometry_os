; DESCRIPTION: Composite: Renders a red line between points (323, 62) and (37, 109) then Places a orange circle of radius 22 at center (451, 77) then Sets a single purple pixel at (284, 25).
; PLAN: r0=323(x1), r1=62(y1), r2=37(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=77(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=25(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 62
LDI r2, 37
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 77
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 25
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
