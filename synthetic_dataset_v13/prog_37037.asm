; DESCRIPTION: Composite: Places a orange circle of radius 74 at center (206, 86) then Draws a magenta line from (483, 247) to (191, 118) then Sets a single orange pixel at (304, 149).
; PLAN: r0=206(x), r1=86(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=247(y1), r7=191(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=149(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 206
LDI r1, 86
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 247
LDI r7, 191
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 149
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
