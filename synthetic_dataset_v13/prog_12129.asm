; DESCRIPTION: Composite: Creates a black rectangular region at (449, 20) spanning 38 by 56 pixels then Places a purple line segment connecting (411, 207) to (430, 118) then Places a white dot at position (442, 159).
; PLAN: r0=449(x), r1=20(y), r2=38(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x1), r6=207(y1), r7=430(x2), r8=118(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=159(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 20
LDI r2, 38
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 207
LDI r7, 430
LDI r8, 118
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 159
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
