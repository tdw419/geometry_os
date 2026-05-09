; DESCRIPTION: Composite: Places a purple dot at position (43, 156) then Draws a cyan line from (115, 206) to (316, 189) then Places a yellow circle of radius 72 at center (87, 100).
; PLAN: r0=43(x), r1=156(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=206(y1), r7=316(x2), r8=189(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=100(y), r12=72(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 156
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 206
LDI r7, 316
LDI r8, 189
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 100
LDI r12, 72
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
