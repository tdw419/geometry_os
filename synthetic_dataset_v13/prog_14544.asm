; DESCRIPTION: Composite: Places a yellow line segment connecting (466, 168) to (272, 89) then Sets a single blue pixel at (293, 184) then Places a red 51x107 rectangle at position (287, 56).
; PLAN: r0=466(x1), r1=168(y1), r2=272(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=184(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=56(y), r12=51(width), r13=107(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 168
LDI r2, 272
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 184
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 287
LDI r11, 56
LDI r12, 51
LDI r13, 107
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
