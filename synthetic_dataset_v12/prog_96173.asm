; DESCRIPTION: Composite: Draws a purple rectangle at (368, 84) with width 97 and height 98 then Places a yellow dot at position (326, 112) then Renders a orange line between points (229, 97) and (98, 254).
; PLAN: r0=368(x), r1=84(y), r2=97(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=112(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=229(x1), r11=97(y1), r12=98(x2), r13=254(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 84
LDI r2, 97
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 112
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 229
LDI r11, 97
LDI r12, 98
LDI r13, 254
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
