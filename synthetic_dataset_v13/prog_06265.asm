; DESCRIPTION: Composite: Places a orange dot at position (483, 141) then Draws a yellow line from (43, 93) to (126, 6) then Renders a black disk with center (216, 135) and radius 56.
; PLAN: r0=483(x), r1=141(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=43(x1), r6=93(y1), r7=126(x2), r8=6(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=135(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 141
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 43
LDI r6, 93
LDI r7, 126
LDI r8, 6
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 135
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
