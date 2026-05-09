; DESCRIPTION: Composite: Creates a red rectangular region at (350, 73) spanning 41 by 98 pixels then Renders a purple line between points (438, 59) and (347, 34) then Places a white dot at position (51, 100).
; PLAN: r0=350(x), r1=73(y), r2=41(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=59(y1), r7=347(x2), r8=34(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=100(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 73
LDI r2, 41
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 59
LDI r7, 347
LDI r8, 34
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 100
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
