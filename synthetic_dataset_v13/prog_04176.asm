; DESCRIPTION: Composite: Places a purple line segment connecting (385, 229) to (126, 64) then Places a red dot at position (330, 7) then Draws a blue circle centered at (133, 79) with radius 76.
; PLAN: r0=385(x1), r1=229(y1), r2=126(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=133(x), r11=79(y), r12=76(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 229
LDI r2, 126
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 133
LDI r11, 79
LDI r12, 76
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
