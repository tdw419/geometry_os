; DESCRIPTION: Composite: Places a orange dot at position (439, 208) then Places a blue 104x118 rectangle at position (142, 116) then Draws a green line from (306, 109) to (155, 176).
; PLAN: r0=439(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=116(y), r7=104(width), r8=118(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x1), r11=109(y1), r12=155(x2), r13=176(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 142
LDI r6, 116
LDI r7, 104
LDI r8, 118
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 109
LDI r12, 155
LDI r13, 176
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
