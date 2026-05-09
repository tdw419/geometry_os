; DESCRIPTION: Composite: Draws a orange line from (120, 23) to (311, 149) then Places a magenta 69x95 rectangle at position (266, 29) then Sets a single black pixel at (417, 166).
; PLAN: r0=120(x1), r1=23(y1), r2=311(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=29(y), r7=69(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=166(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 23
LDI r2, 311
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 29
LDI r7, 69
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 166
LDI r12, 0x000000
PSET r10, r11, r12
HALT
