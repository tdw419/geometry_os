; DESCRIPTION: Composite: Sets a single red pixel at (438, 89) then Renders a purple line between points (490, 106) and (14, 167) then Places a red 119x49 rectangle at position (82, 100).
; PLAN: r0=438(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=490(x1), r6=106(y1), r7=14(x2), r8=167(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=100(y), r12=119(width), r13=49(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 490
LDI r6, 106
LDI r7, 14
LDI r8, 167
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 100
LDI r12, 119
LDI r13, 49
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
