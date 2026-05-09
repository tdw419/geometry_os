; DESCRIPTION: Composite: Draws a red rectangle at (342, 51) with width 25 and height 74 then Renders a blue line between points (116, 21) and (25, 251) then Sets a single magenta pixel at (74, 161).
; PLAN: r0=342(x), r1=51(y), r2=25(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=21(y1), r7=25(x2), r8=251(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=161(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 51
LDI r2, 25
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 21
LDI r7, 25
LDI r8, 251
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 161
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
