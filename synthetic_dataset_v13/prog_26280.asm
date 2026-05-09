; DESCRIPTION: Composite: Renders a red box of size 56x105 starting at (41, 93) then Renders a orange line between points (62, 149) and (68, 126) then Places a red dot at position (484, 63).
; PLAN: r0=41(x), r1=93(y), r2=56(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x1), r6=149(y1), r7=68(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=484(x), r11=63(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 93
LDI r2, 56
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 149
LDI r7, 68
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 63
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
