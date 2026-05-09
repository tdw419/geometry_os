; DESCRIPTION: Composite: Places a white dot at position (389, 133) then Creates a black rectangular region at (212, 97) spanning 92 by 69 pixels then Renders a cyan line between points (137, 253) and (441, 3).
; PLAN: r0=389(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=97(y), r7=92(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x1), r11=253(y1), r12=441(x2), r13=3(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 212
LDI r6, 97
LDI r7, 92
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 253
LDI r12, 441
LDI r13, 3
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
