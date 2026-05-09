; DESCRIPTION: Composite: Draws a black rectangle at (189, 18) with width 110 and height 24 then Places a white dot at position (266, 235) then Renders a purple line between points (351, 63) and (112, 90).
; PLAN: r0=189(x), r1=18(y), r2=110(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=235(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=351(x1), r11=63(y1), r12=112(x2), r13=90(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 18
LDI r2, 110
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 235
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 63
LDI r12, 112
LDI r13, 90
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
