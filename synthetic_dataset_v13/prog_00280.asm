; DESCRIPTION: Composite: Renders a green line between points (251, 207) and (349, 15) then Sets a single blue pixel at (483, 29) then Places a black 17x113 rectangle at position (234, 2).
; PLAN: r0=251(x1), r1=207(y1), r2=349(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=29(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=2(y), r12=17(width), r13=113(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 207
LDI r2, 349
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 29
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 234
LDI r11, 2
LDI r12, 17
LDI r13, 113
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
