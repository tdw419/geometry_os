; DESCRIPTION: Composite: Draws a black rectangle at (231, 156) with width 81 and height 28 then Renders a yellow line between points (33, 195) and (362, 60) then Sets a single yellow pixel at (390, 6).
; PLAN: r0=231(x), r1=156(y), r2=81(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=195(y1), r7=362(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=6(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 156
LDI r2, 81
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 195
LDI r7, 362
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 6
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
