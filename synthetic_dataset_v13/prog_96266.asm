; DESCRIPTION: Composite: Sets a single red pixel at (389, 65) then Renders a white line between points (134, 53) and (347, 242) then Draws a green circle centered at (251, 106) with radius 54.
; PLAN: r0=389(x), r1=65(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=134(x1), r6=53(y1), r7=347(x2), r8=242(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=106(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 65
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 134
LDI r6, 53
LDI r7, 347
LDI r8, 242
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 106
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
