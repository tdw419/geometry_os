; DESCRIPTION: Composite: Draws a green line from (272, 9) to (253, 126) then Sets a single purple pixel at (347, 230) then Renders a magenta box of size 17x89 starting at (250, 63).
; PLAN: r0=272(x1), r1=9(y1), r2=253(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=230(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=250(x), r11=63(y), r12=17(width), r13=89(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 9
LDI r2, 253
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 230
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 250
LDI r11, 63
LDI r12, 17
LDI r13, 89
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
