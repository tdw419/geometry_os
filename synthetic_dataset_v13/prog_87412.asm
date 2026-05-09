; DESCRIPTION: Composite: Places a green 118x82 rectangle at position (340, 115) then Renders a orange line between points (399, 192) and (505, 216) then Places a orange dot at position (443, 205).
; PLAN: r0=340(x), r1=115(y), r2=118(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=192(y1), r7=505(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=205(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 115
LDI r2, 118
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 192
LDI r7, 505
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 205
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
