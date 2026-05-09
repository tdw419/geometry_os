; DESCRIPTION: Composite: Renders a orange line between points (241, 217) and (396, 195) then Places a purple dot at position (350, 61) then Creates a black rectangular region at (383, 10) spanning 43 by 114 pixels.
; PLAN: r0=241(x1), r1=217(y1), r2=396(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=61(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=10(y), r12=43(width), r13=114(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 217
LDI r2, 396
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 61
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 10
LDI r12, 43
LDI r13, 114
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
