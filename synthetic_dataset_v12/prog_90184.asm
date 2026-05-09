; DESCRIPTION: Composite: Places a orange dot at position (250, 88) then Draws a green line from (114, 37) to (492, 133) then Creates a black circular shape at (458, 75) with radius 46.
; PLAN: r0=250(x), r1=88(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=37(y1), r7=492(x2), r8=133(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=75(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 250
LDI r1, 88
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 114
LDI r6, 37
LDI r7, 492
LDI r8, 133
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 75
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
