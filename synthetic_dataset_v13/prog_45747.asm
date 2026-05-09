; DESCRIPTION: Composite: Draws a purple rectangle at (89, 169) with width 113 and height 22 then Sets a single magenta pixel at (443, 162) then Places a black line segment connecting (231, 118) to (116, 169).
; PLAN: r0=89(x), r1=169(y), r2=113(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=162(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=231(x1), r11=118(y1), r12=116(x2), r13=169(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 169
LDI r2, 113
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 162
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 231
LDI r11, 118
LDI r12, 116
LDI r13, 169
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
