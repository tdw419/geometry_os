; DESCRIPTION: Composite: Draws a purple line from (380, 94) to (365, 198) then Sets a single yellow pixel at (140, 168) then Creates a blue rectangular region at (143, 238) spanning 79 by 15 pixels.
; PLAN: r0=380(x1), r1=94(y1), r2=365(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=168(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=238(y), r12=79(width), r13=15(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 94
LDI r2, 365
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 168
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 143
LDI r11, 238
LDI r12, 79
LDI r13, 15
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
