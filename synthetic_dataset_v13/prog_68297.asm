; DESCRIPTION: Composite: Renders a purple line between points (210, 189) and (52, 179) then Creates a blue rectangular region at (51, 146) spanning 44 by 88 pixels then Places a purple dot at position (443, 83).
; PLAN: r0=210(x1), r1=189(y1), r2=52(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=146(y), r7=44(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=83(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 189
LDI r2, 52
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 146
LDI r7, 44
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 83
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
