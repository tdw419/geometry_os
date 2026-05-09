; DESCRIPTION: Composite: Draws a purple rectangle at (481, 161) with width 20 and height 57 then Renders a blue line between points (250, 19) and (14, 156) then Places a yellow dot at position (143, 29).
; PLAN: r0=481(x), r1=161(y), r2=20(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x1), r6=19(y1), r7=14(x2), r8=156(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=29(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 481
LDI r1, 161
LDI r2, 20
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 19
LDI r7, 14
LDI r8, 156
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 29
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
