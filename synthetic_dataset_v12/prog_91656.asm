; DESCRIPTION: Composite: Places a black 114x40 rectangle at position (25, 76) then Sets a single orange pixel at (413, 99) then Renders a red line between points (458, 211) and (278, 145).
; PLAN: r0=25(x), r1=76(y), r2=114(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=99(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=458(x1), r11=211(y1), r12=278(x2), r13=145(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 76
LDI r2, 114
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 99
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 458
LDI r11, 211
LDI r12, 278
LDI r13, 145
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
