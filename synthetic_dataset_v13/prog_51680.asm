; DESCRIPTION: Composite: Renders a red box of size 117x44 starting at (246, 155) then Renders a white line between points (349, 97) and (107, 195) then Places a red dot at position (427, 205).
; PLAN: r0=246(x), r1=155(y), r2=117(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=97(y1), r7=107(x2), r8=195(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=205(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 246
LDI r1, 155
LDI r2, 117
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 97
LDI r7, 107
LDI r8, 195
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 205
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
