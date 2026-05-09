; DESCRIPTION: Composite: Places a white circle of radius 62 at center (156, 163) then Draws a orange line from (26, 5) to (447, 152) then Sets a single red pixel at (11, 196).
; PLAN: r0=156(x), r1=163(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=5(y1), r7=447(x2), r8=152(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=196(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 163
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 5
LDI r7, 447
LDI r8, 152
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 196
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
