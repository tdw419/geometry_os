; DESCRIPTION: Composite: Places a black dot at position (163, 236) then Renders a white line between points (147, 53) and (507, 98) then Draws a blue rectangle at (432, 179) with width 44 and height 44.
; PLAN: r0=163(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=53(y1), r7=507(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=432(x), r11=179(y), r12=44(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 147
LDI r6, 53
LDI r7, 507
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 179
LDI r12, 44
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
