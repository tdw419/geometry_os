; DESCRIPTION: Composite: Renders a black line between points (510, 91) and (199, 184) then Renders a orange box of size 115x118 starting at (176, 34) then Places a yellow dot at position (147, 115).
; PLAN: r0=510(x1), r1=91(y1), r2=199(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=34(y), r7=115(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=115(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 510
LDI r1, 91
LDI r2, 199
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 34
LDI r7, 115
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 115
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
