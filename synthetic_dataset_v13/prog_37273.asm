; DESCRIPTION: Composite: Places a white circle of radius 41 at center (400, 158) then Draws a orange line from (81, 63) to (440, 95) then Sets a single red pixel at (199, 168).
; PLAN: r0=400(x), r1=158(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=63(y1), r7=440(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=168(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 158
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 63
LDI r7, 440
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 168
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
