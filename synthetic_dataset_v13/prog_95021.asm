; DESCRIPTION: Composite: Creates a purple rectangular region at (300, 22) spanning 119 by 81 pixels then Renders a red line between points (211, 77) and (138, 35) then Places a purple dot at position (486, 58).
; PLAN: r0=300(x), r1=22(y), r2=119(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x1), r6=77(y1), r7=138(x2), r8=35(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=486(x), r11=58(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 22
LDI r2, 119
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 77
LDI r7, 138
LDI r8, 35
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 58
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
