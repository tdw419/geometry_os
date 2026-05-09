; DESCRIPTION: Composite: Renders a yellow line between points (53, 179) and (330, 104) then Renders a magenta box of size 80x26 starting at (51, 65) then Sets a single black pixel at (248, 212).
; PLAN: r0=53(x1), r1=179(y1), r2=330(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=65(y), r7=80(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x), r11=212(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 179
LDI r2, 330
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 65
LDI r7, 80
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 212
LDI r12, 0x000000
PSET r10, r11, r12
HALT
