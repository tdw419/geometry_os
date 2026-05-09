; DESCRIPTION: Composite: Renders a green disk with center (304, 119) and radius 62 then Draws a orange line from (93, 135) to (419, 141) then Sets a single cyan pixel at (484, 37).
; PLAN: r0=304(x), r1=119(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x1), r6=135(y1), r7=419(x2), r8=141(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=484(x), r11=37(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 119
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 135
LDI r7, 419
LDI r8, 141
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 37
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
