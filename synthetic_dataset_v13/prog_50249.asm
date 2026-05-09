; DESCRIPTION: Composite: Places a yellow 120x107 rectangle at position (356, 58) then Renders a yellow line between points (38, 161) and (430, 164) then Places a purple dot at position (97, 106).
; PLAN: r0=356(x), r1=58(y), r2=120(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x1), r6=161(y1), r7=430(x2), r8=164(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=106(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 58
LDI r2, 120
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 161
LDI r7, 430
LDI r8, 164
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 106
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
