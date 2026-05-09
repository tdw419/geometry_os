; DESCRIPTION: Composite: Renders a red disk with center (376, 175) and radius 74 then Draws a orange line from (32, 218) to (41, 35) then Sets a single orange pixel at (484, 32).
; PLAN: r0=376(x), r1=175(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=218(y1), r7=41(x2), r8=35(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=484(x), r11=32(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 175
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 218
LDI r7, 41
LDI r8, 35
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 32
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
