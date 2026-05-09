; DESCRIPTION: Composite: Places a green circle of radius 13 at center (385, 213) then Sets a single yellow pixel at (122, 123) then Draws a orange line from (212, 173) to (246, 47).
; PLAN: r0=385(x), r1=213(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=123(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=212(x1), r11=173(y1), r12=246(x2), r13=47(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 213
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 123
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 212
LDI r11, 173
LDI r12, 246
LDI r13, 47
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
