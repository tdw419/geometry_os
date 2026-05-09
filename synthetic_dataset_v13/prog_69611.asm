; DESCRIPTION: Composite: Draws a red rectangle at (411, 15) with width 71 and height 52 then Renders a red line between points (135, 66) and (106, 36) then Sets a single magenta pixel at (232, 85).
; PLAN: r0=411(x), r1=15(y), r2=71(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x1), r6=66(y1), r7=106(x2), r8=36(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=85(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 15
LDI r2, 71
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 66
LDI r7, 106
LDI r8, 36
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 85
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
