; DESCRIPTION: Composite: Renders a green line between points (460, 197) and (94, 115) then Sets a single purple pixel at (508, 145) then Renders a black disk with center (349, 190) and radius 26.
; PLAN: r0=460(x1), r1=197(y1), r2=94(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=508(x), r6=145(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=349(x), r11=190(y), r12=26(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 197
LDI r2, 94
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 145
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 349
LDI r11, 190
LDI r12, 26
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
