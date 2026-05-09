; DESCRIPTION: Composite: Renders a white line between points (193, 176) and (471, 44) then Renders a white box of size 102x41 starting at (342, 145) then Places a red dot at position (155, 88).
; PLAN: r0=193(x1), r1=176(y1), r2=471(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=145(y), r7=102(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=88(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 176
LDI r2, 471
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 145
LDI r7, 102
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 88
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
