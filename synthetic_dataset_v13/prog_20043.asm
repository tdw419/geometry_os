; DESCRIPTION: Composite: Draws a purple line from (508, 251) to (208, 235) then Sets a single blue pixel at (186, 156) then Draws a blue rectangle at (284, 97) with width 120 and height 51.
; PLAN: r0=508(x1), r1=251(y1), r2=208(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=156(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=97(y), r12=120(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 251
LDI r2, 208
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 156
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 284
LDI r11, 97
LDI r12, 120
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
