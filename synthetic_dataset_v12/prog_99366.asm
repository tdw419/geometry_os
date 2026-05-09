; DESCRIPTION: Composite: Draws a blue line from (209, 181) to (286, 17) then Places a purple dot at position (257, 248) then Draws a purple circle centered at (94, 58) with radius 58.
; PLAN: r0=209(x1), r1=181(y1), r2=286(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=248(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=58(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 209
LDI r1, 181
LDI r2, 286
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 248
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 58
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
