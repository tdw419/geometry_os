; DESCRIPTION: Composite: Draws a orange line from (141, 64) to (52, 174) then Sets a single purple pixel at (126, 215) then Draws a orange circle centered at (222, 175) with radius 79.
; PLAN: r0=141(x1), r1=64(y1), r2=52(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=215(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=175(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 141
LDI r1, 64
LDI r2, 52
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 215
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 222
LDI r11, 175
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
