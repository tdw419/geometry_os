; DESCRIPTION: Composite: Draws a purple line from (169, 155) to (274, 131) then Places a red 65x38 rectangle at position (250, 163) then Places a magenta dot at position (438, 121).
; PLAN: r0=169(x1), r1=155(y1), r2=274(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=163(y), r7=65(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=121(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 155
LDI r2, 274
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 163
LDI r7, 65
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 121
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
