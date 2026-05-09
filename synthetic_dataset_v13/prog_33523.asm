; DESCRIPTION: Composite: Creates a orange circular shape at (211, 89) with radius 75 then Draws a cyan line from (100, 83) to (498, 123) then Sets a single cyan pixel at (496, 30).
; PLAN: r0=211(x), r1=89(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x1), r6=83(y1), r7=498(x2), r8=123(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=30(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 89
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 83
LDI r7, 498
LDI r8, 123
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 30
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
