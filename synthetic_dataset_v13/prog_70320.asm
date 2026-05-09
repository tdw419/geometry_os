; DESCRIPTION: Composite: Places a orange dot at position (355, 76) then Renders a red line between points (316, 133) and (125, 145) then Draws a magenta rectangle at (469, 82) with width 21 and height 93.
; PLAN: r0=355(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=316(x1), r6=133(y1), r7=125(x2), r8=145(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=82(y), r12=21(width), r13=93(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 316
LDI r6, 133
LDI r7, 125
LDI r8, 145
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 82
LDI r12, 21
LDI r13, 93
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
