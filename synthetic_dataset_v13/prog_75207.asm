; DESCRIPTION: Composite: Draws a magenta rectangle at (314, 170) with width 74 and height 12 then Renders a magenta line between points (299, 140) and (302, 97) then Sets a single black pixel at (93, 78).
; PLAN: r0=314(x), r1=170(y), r2=74(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=140(y1), r7=302(x2), r8=97(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=78(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 170
LDI r2, 74
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 140
LDI r7, 302
LDI r8, 97
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 78
LDI r12, 0x000000
PSET r10, r11, r12
HALT
