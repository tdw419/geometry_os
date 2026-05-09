; DESCRIPTION: Composite: Sets a single orange pixel at (102, 20) then Renders a red line between points (98, 188) and (318, 252) then Creates a blue circular shape at (307, 100) with radius 75.
; PLAN: r0=102(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=98(x1), r6=188(y1), r7=318(x2), r8=252(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=307(x), r11=100(y), r12=75(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 98
LDI r6, 188
LDI r7, 318
LDI r8, 252
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 100
LDI r12, 75
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
