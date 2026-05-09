; DESCRIPTION: Composite: Creates a black rectangular region at (314, 87) spanning 107 by 106 pixels then Places a blue dot at position (254, 98) then Places a black line segment connecting (498, 60) to (122, 118).
; PLAN: r0=314(x), r1=87(y), r2=107(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=98(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=498(x1), r11=60(y1), r12=122(x2), r13=118(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 87
LDI r2, 107
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 98
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 498
LDI r11, 60
LDI r12, 122
LDI r13, 118
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
