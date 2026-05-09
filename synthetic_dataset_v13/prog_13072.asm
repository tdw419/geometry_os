; DESCRIPTION: Composite: Places a blue dot at position (418, 181) then Creates a purple rectangular region at (118, 2) spanning 77 by 58 pixels then Draws a green line from (249, 232) to (488, 194).
; PLAN: r0=418(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=2(y), r7=77(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x1), r11=232(y1), r12=488(x2), r13=194(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 2
LDI r7, 77
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 232
LDI r12, 488
LDI r13, 194
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
