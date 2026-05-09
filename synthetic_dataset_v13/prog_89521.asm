; DESCRIPTION: Composite: Places a orange dot at position (292, 60) then Draws a red line from (441, 89) to (61, 223) then Creates a green circular shape at (86, 133) with radius 33.
; PLAN: r0=292(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=89(y1), r7=61(x2), r8=223(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=133(y), r12=33(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 441
LDI r6, 89
LDI r7, 61
LDI r8, 223
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 133
LDI r12, 33
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
