; DESCRIPTION: Composite: Sets a single black pixel at (125, 186) then Renders a blue line between points (127, 89) and (110, 112) then Places a yellow 86x49 rectangle at position (159, 95).
; PLAN: r0=125(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=89(y1), r7=110(x2), r8=112(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=95(y), r12=86(width), r13=49(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 127
LDI r6, 89
LDI r7, 110
LDI r8, 112
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 95
LDI r12, 86
LDI r13, 49
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
