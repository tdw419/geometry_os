; DESCRIPTION: Composite: Places a red dot at position (178, 75) then Draws a purple line from (26, 148) to (347, 113) then Places a white 84x13 rectangle at position (118, 234).
; PLAN: r0=178(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=26(x1), r6=148(y1), r7=347(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=118(x), r11=234(y), r12=84(width), r13=13(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 26
LDI r6, 148
LDI r7, 347
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 234
LDI r12, 84
LDI r13, 13
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
