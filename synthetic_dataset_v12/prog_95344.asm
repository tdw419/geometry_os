; DESCRIPTION: Composite: Renders a red line between points (484, 11) and (195, 127) then Places a purple circle of radius 51 at center (427, 89) then Sets a single cyan pixel at (79, 208).
; PLAN: r0=484(x1), r1=11(y1), r2=195(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=89(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=208(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 484
LDI r1, 11
LDI r2, 195
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 89
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 208
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
