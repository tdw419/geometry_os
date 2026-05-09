; DESCRIPTION: Composite: Draws a green line from (351, 179) to (293, 72) then Draws a green rectangle at (56, 2) with width 59 and height 115 then Sets a single black pixel at (396, 155).
; PLAN: r0=351(x1), r1=179(y1), r2=293(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=2(y), r7=59(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x), r11=155(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 179
LDI r2, 293
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 2
LDI r7, 59
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 155
LDI r12, 0x000000
PSET r10, r11, r12
HALT
