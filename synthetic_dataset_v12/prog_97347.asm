; DESCRIPTION: Composite: Places a red line segment connecting (14, 76) to (498, 216) then Renders a white box of size 115x89 starting at (19, 1) then Sets a single white pixel at (31, 161).
; PLAN: r0=14(x1), r1=76(y1), r2=498(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=1(y), r7=115(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=161(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 76
LDI r2, 498
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 1
LDI r7, 115
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 161
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
