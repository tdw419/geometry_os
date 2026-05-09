; DESCRIPTION: Composite: Creates a black rectangular region at (98, 51) spanning 51 by 79 pixels then Renders a purple line between points (266, 105) and (92, 93) then Places a yellow dot at position (336, 252).
; PLAN: r0=98(x), r1=51(y), r2=51(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=105(y1), r7=92(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=252(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 51
LDI r2, 51
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 105
LDI r7, 92
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 252
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
