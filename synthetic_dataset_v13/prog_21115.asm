; DESCRIPTION: Composite: Places a black circle of radius 11 at center (80, 163) then Places a purple dot at position (286, 26) then Draws a red line from (210, 123) to (396, 28).
; PLAN: r0=80(x), r1=163(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=26(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=210(x1), r11=123(y1), r12=396(x2), r13=28(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 163
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 26
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 210
LDI r11, 123
LDI r12, 396
LDI r13, 28
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
