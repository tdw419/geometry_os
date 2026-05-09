; DESCRIPTION: Composite: Draws a blue line from (185, 100) to (438, 241) then Renders a blue box of size 81x61 starting at (14, 191) then Places a purple dot at position (161, 80).
; PLAN: r0=185(x1), r1=100(y1), r2=438(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=191(y), r7=81(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x), r11=80(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 100
LDI r2, 438
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 191
LDI r7, 81
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 80
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
