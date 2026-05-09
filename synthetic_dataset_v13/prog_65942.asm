; DESCRIPTION: Composite: Creates a purple rectangular region at (112, 117) spanning 106 by 41 pixels then Renders a purple line between points (496, 172) and (398, 217) then Sets a single green pixel at (458, 133).
; PLAN: r0=112(x), r1=117(y), r2=106(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x1), r6=172(y1), r7=398(x2), r8=217(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=133(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 117
LDI r2, 106
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 172
LDI r7, 398
LDI r8, 217
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 133
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
