; DESCRIPTION: Composite: Renders a orange line between points (209, 6) and (467, 63) then Places a purple dot at position (486, 206) then Draws a blue rectangle at (155, 134) with width 55 and height 20.
; PLAN: r0=209(x1), r1=6(y1), r2=467(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=206(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=134(y), r12=55(width), r13=20(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 6
LDI r2, 467
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 206
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 155
LDI r11, 134
LDI r12, 55
LDI r13, 20
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
