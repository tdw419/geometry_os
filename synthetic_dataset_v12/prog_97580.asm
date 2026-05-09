; DESCRIPTION: Composite: Draws a purple line from (292, 94) to (266, 132) then Places a black circle of radius 68 at center (157, 94) then Sets a single magenta pixel at (222, 41).
; PLAN: r0=292(x1), r1=94(y1), r2=266(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=94(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=41(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 94
LDI r2, 266
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 94
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 41
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
