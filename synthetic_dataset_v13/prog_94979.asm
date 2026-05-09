; DESCRIPTION: Composite: Renders a orange line between points (215, 253) and (199, 41) then Places a green 23x106 rectangle at position (145, 63) then Sets a single black pixel at (297, 161).
; PLAN: r0=215(x1), r1=253(y1), r2=199(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=63(y), r7=23(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=161(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 253
LDI r2, 199
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 63
LDI r7, 23
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 161
LDI r12, 0x000000
PSET r10, r11, r12
HALT
