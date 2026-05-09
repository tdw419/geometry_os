; DESCRIPTION: Composite: Draws a black line from (173, 12) to (117, 194) then Sets a single yellow pixel at (337, 51) then Places a purple 12x87 rectangle at position (390, 153).
; PLAN: r0=173(x1), r1=12(y1), r2=117(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=51(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=153(y), r12=12(width), r13=87(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 12
LDI r2, 117
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 51
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 390
LDI r11, 153
LDI r12, 12
LDI r13, 87
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
