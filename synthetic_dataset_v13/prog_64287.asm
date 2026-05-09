; DESCRIPTION: Composite: Places a purple dot at position (55, 132) then Draws a purple rectangle at (415, 73) with width 88 and height 89 then Renders a red line between points (424, 109) and (33, 78).
; PLAN: r0=55(x), r1=132(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=73(y), r7=88(width), r8=89(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=424(x1), r11=109(y1), r12=33(x2), r13=78(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 132
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 73
LDI r7, 88
LDI r8, 89
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 109
LDI r12, 33
LDI r13, 78
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
