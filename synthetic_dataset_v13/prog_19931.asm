; DESCRIPTION: Composite: Draws a yellow circle centered at (87, 85) with radius 23 then Draws a white line from (505, 184) to (23, 216) then Sets a single red pixel at (125, 169).
; PLAN: r0=87(x), r1=85(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x1), r6=184(y1), r7=23(x2), r8=216(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=169(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 85
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 184
LDI r7, 23
LDI r8, 216
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 169
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
