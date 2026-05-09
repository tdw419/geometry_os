; DESCRIPTION: Composite: Places a magenta 39x107 rectangle at position (396, 121) then Renders a red line between points (121, 13) and (190, 35) then Sets a single red pixel at (376, 78).
; PLAN: r0=396(x), r1=121(y), r2=39(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=13(y1), r7=190(x2), r8=35(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=376(x), r11=78(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 121
LDI r2, 39
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 13
LDI r7, 190
LDI r8, 35
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 78
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
