; DESCRIPTION: Composite: Draws a black rectangle at (163, 137) with width 55 and height 89 then Places a black dot at position (35, 127) then Renders a red line between points (31, 255) and (15, 133).
; PLAN: r0=163(x), r1=137(y), r2=55(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=127(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=31(x1), r11=255(y1), r12=15(x2), r13=133(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 137
LDI r2, 55
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 127
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 31
LDI r11, 255
LDI r12, 15
LDI r13, 133
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
