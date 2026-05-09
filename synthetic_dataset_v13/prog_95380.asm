; DESCRIPTION: Composite: Creates a red circular shape at (143, 209) with radius 41 then Places a cyan line segment connecting (389, 118) to (89, 122) then Sets a single orange pixel at (323, 30).
; PLAN: r0=143(x), r1=209(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x1), r6=118(y1), r7=89(x2), r8=122(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=30(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 209
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 118
LDI r7, 89
LDI r8, 122
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 30
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
