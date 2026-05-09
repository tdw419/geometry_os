; DESCRIPTION: Composite: Renders a white line between points (155, 208) and (178, 235) then Sets a single red pixel at (137, 216) then Draws a white rectangle at (206, 104) with width 49 and height 10.
; PLAN: r0=155(x1), r1=208(y1), r2=178(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=216(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=104(y), r12=49(width), r13=10(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 208
LDI r2, 178
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 216
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 206
LDI r11, 104
LDI r12, 49
LDI r13, 10
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
