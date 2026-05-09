; DESCRIPTION: Composite: Renders a yellow line between points (155, 232) and (339, 49) then Draws a orange rectangle at (174, 21) with width 43 and height 24 then Places a blue dot at position (352, 128).
; PLAN: r0=155(x1), r1=232(y1), r2=339(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=21(y), r7=43(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x), r11=128(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 232
LDI r2, 339
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 21
LDI r7, 43
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 128
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
