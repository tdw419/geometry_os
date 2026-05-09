; DESCRIPTION: Composite: Places a cyan dot at position (115, 238) then Renders a orange line between points (1, 159) and (184, 76) then Draws a red circle centered at (451, 116) with radius 45.
; PLAN: r0=115(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=1(x1), r6=159(y1), r7=184(x2), r8=76(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=451(x), r11=116(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 1
LDI r6, 159
LDI r7, 184
LDI r8, 76
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 116
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
