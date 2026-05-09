; DESCRIPTION: Composite: Renders a red line between points (443, 246) and (78, 177) then Creates a black rectangular region at (50, 105) spanning 19 by 13 pixels then Sets a single magenta pixel at (276, 254).
; PLAN: r0=443(x1), r1=246(y1), r2=78(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=105(y), r7=19(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=254(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 443
LDI r1, 246
LDI r2, 78
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 105
LDI r7, 19
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 254
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
