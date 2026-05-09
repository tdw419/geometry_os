; DESCRIPTION: Composite: Places a blue dot at position (430, 43) then Draws a red line from (143, 95) to (101, 220) then Renders a purple disk with center (157, 139) and radius 36.
; PLAN: r0=430(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=143(x1), r6=95(y1), r7=101(x2), r8=220(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=139(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 430
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 143
LDI r6, 95
LDI r7, 101
LDI r8, 220
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 139
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
