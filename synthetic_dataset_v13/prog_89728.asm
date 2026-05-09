; DESCRIPTION: Composite: Renders a yellow line between points (78, 184) and (109, 206) then Places a orange 43x45 rectangle at position (41, 210) then Sets a single green pixel at (369, 185).
; PLAN: r0=78(x1), r1=184(y1), r2=109(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=210(y), r7=43(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=369(x), r11=185(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 184
LDI r2, 109
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 210
LDI r7, 43
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 185
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
