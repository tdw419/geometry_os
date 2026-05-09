; DESCRIPTION: Composite: Renders a blue line between points (156, 140) and (511, 57) then Places a black 26x85 rectangle at position (391, 29) then Sets a single yellow pixel at (71, 195).
; PLAN: r0=156(x1), r1=140(y1), r2=511(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=29(y), r7=26(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=195(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 140
LDI r2, 511
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 29
LDI r7, 26
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 195
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
