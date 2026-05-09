; DESCRIPTION: Composite: Draws a yellow circle centered at (217, 155) with radius 58 then Places a red line segment connecting (483, 216) to (150, 243) then Sets a single purple pixel at (376, 140).
; PLAN: r0=217(x), r1=155(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=216(y1), r7=150(x2), r8=243(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=376(x), r11=140(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 155
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 216
LDI r7, 150
LDI r8, 243
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 140
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
