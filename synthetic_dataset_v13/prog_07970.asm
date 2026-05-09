; DESCRIPTION: Composite: Draws a purple line from (251, 189) to (229, 122) then Places a yellow circle of radius 75 at center (434, 106) then Sets a single red pixel at (105, 166).
; PLAN: r0=251(x1), r1=189(y1), r2=229(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=106(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x), r11=166(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 189
LDI r2, 229
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 106
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 166
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
