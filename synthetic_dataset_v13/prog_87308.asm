; DESCRIPTION: Composite: Draws a purple line from (486, 15) to (172, 131) then Places a yellow 81x118 rectangle at position (379, 86) then Places a black dot at position (409, 145).
; PLAN: r0=486(x1), r1=15(y1), r2=172(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=86(y), r7=81(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=145(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 15
LDI r2, 172
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 86
LDI r7, 81
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 145
LDI r12, 0x000000
PSET r10, r11, r12
HALT
