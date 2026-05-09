; DESCRIPTION: Composite: Creates a black rectangular region at (77, 118) spanning 98 by 11 pixels then Places a red dot at position (235, 131) then Draws a black line from (392, 7) to (217, 46).
; PLAN: r0=77(x), r1=118(y), r2=98(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=131(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=392(x1), r11=7(y1), r12=217(x2), r13=46(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 118
LDI r2, 98
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 131
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 392
LDI r11, 7
LDI r12, 217
LDI r13, 46
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
