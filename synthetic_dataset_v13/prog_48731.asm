; DESCRIPTION: Composite: Renders a yellow line between points (484, 41) and (145, 231) then Places a green dot at position (29, 7) then Draws a purple rectangle at (334, 46) with width 26 and height 111.
; PLAN: r0=484(x1), r1=41(y1), r2=145(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=7(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=334(x), r11=46(y), r12=26(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 41
LDI r2, 145
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 7
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 334
LDI r11, 46
LDI r12, 26
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
