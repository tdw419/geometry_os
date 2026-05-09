; DESCRIPTION: Composite: Renders a yellow box of size 92x81 starting at (306, 64) then Renders a purple line between points (90, 71) and (318, 232) then Sets a single black pixel at (94, 84).
; PLAN: r0=306(x), r1=64(y), r2=92(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x1), r6=71(y1), r7=318(x2), r8=232(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=94(x), r11=84(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 64
LDI r2, 92
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 71
LDI r7, 318
LDI r8, 232
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 84
LDI r12, 0x000000
PSET r10, r11, r12
HALT
