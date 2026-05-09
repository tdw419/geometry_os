; DESCRIPTION: Composite: Draws a magenta rectangle at (395, 118) with width 28 and height 45 then Renders a white line between points (133, 78) and (147, 29) then Sets a single blue pixel at (394, 139).
; PLAN: r0=395(x), r1=118(y), r2=28(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x1), r6=78(y1), r7=147(x2), r8=29(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=139(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 395
LDI r1, 118
LDI r2, 28
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 78
LDI r7, 147
LDI r8, 29
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 139
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
