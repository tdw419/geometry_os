; DESCRIPTION: Composite: Draws a yellow line from (448, 220) to (84, 106) then Draws a yellow rectangle at (125, 55) with width 44 and height 67 then Places a yellow dot at position (302, 75).
; PLAN: r0=448(x1), r1=220(y1), r2=84(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=55(y), r7=44(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=75(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 220
LDI r2, 84
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 55
LDI r7, 44
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 75
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
