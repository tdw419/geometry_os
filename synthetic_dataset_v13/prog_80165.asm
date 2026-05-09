; DESCRIPTION: Composite: Draws a cyan rectangle at (203, 144) with width 56 and height 89 then Sets a single purple pixel at (248, 97) then Places a red line segment connecting (156, 144) to (328, 155).
; PLAN: r0=203(x), r1=144(y), r2=56(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=97(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=156(x1), r11=144(y1), r12=328(x2), r13=155(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 144
LDI r2, 56
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 97
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 156
LDI r11, 144
LDI r12, 328
LDI r13, 155
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
