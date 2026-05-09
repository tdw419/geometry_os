; DESCRIPTION: Composite: Places a black line segment connecting (449, 61) to (505, 1) then Places a purple dot at position (162, 118) then Places a purple 38x94 rectangle at position (286, 106).
; PLAN: r0=449(x1), r1=61(y1), r2=505(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=118(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=106(y), r12=38(width), r13=94(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 61
LDI r2, 505
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 118
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 106
LDI r12, 38
LDI r13, 94
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
