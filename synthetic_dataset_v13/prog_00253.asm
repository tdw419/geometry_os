; DESCRIPTION: Composite: Places a black dot at position (191, 235) then Creates a white rectangular region at (155, 70) spanning 41 by 29 pixels then Places a red line segment connecting (179, 169) to (23, 41).
; PLAN: r0=191(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=70(y), r7=41(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x1), r11=169(y1), r12=23(x2), r13=41(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 70
LDI r7, 41
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 169
LDI r12, 23
LDI r13, 41
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
