; DESCRIPTION: Composite: Renders a purple line between points (15, 85) and (486, 192) then Renders a purple box of size 103x12 starting at (227, 231) then Sets a single blue pixel at (459, 179).
; PLAN: r0=15(x1), r1=85(y1), r2=486(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=231(y), r7=103(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=459(x), r11=179(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 15
LDI r1, 85
LDI r2, 486
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 231
LDI r7, 103
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 179
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
