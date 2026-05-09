; DESCRIPTION: Composite: Draws a black rectangle at (230, 179) with width 93 and height 10 then Renders a orange line between points (229, 224) and (355, 35) then Places a cyan dot at position (329, 212).
; PLAN: r0=230(x), r1=179(y), r2=93(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x1), r6=224(y1), r7=355(x2), r8=35(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=212(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 179
LDI r2, 93
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 224
LDI r7, 355
LDI r8, 35
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 212
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
