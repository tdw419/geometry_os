; DESCRIPTION: Composite: Creates a red circular shape at (138, 118) with radius 62 then Draws a orange line from (349, 222) to (70, 77) then Sets a single orange pixel at (102, 181).
; PLAN: r0=138(x), r1=118(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=222(y1), r7=70(x2), r8=77(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=181(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 118
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 222
LDI r7, 70
LDI r8, 77
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 181
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
