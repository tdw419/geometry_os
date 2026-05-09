; DESCRIPTION: Composite: Places a purple line segment connecting (12, 24) to (66, 201) then Draws a purple rectangle at (24, 18) with width 72 and height 115 then Sets a single yellow pixel at (351, 113).
; PLAN: r0=12(x1), r1=24(y1), r2=66(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=18(y), r7=72(width), r8=115(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x), r11=113(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 24
LDI r2, 66
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 18
LDI r7, 72
LDI r8, 115
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 113
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
