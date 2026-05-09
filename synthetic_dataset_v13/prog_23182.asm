; DESCRIPTION: Composite: Places a purple circle of radius 19 at center (97, 187) then Sets a single black pixel at (58, 51) then Draws a magenta line from (383, 143) to (421, 34).
; PLAN: r0=97(x), r1=187(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=51(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=143(y1), r12=421(x2), r13=34(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 187
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 51
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 383
LDI r11, 143
LDI r12, 421
LDI r13, 34
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
