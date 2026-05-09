; DESCRIPTION: Composite: Draws a white rectangle at (112, 185) with width 11 and height 68 then Renders a purple line between points (457, 220) and (323, 116) then Sets a single blue pixel at (429, 17).
; PLAN: r0=112(x), r1=185(y), r2=11(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=220(y1), r7=323(x2), r8=116(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=17(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 185
LDI r2, 11
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 220
LDI r7, 323
LDI r8, 116
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 17
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
