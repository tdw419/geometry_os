; DESCRIPTION: Composite: Draws a blue rectangle at (102, 144) with width 49 and height 75 then Places a yellow dot at position (29, 202) then Renders a yellow line between points (496, 213) and (147, 67).
; PLAN: r0=102(x), r1=144(y), r2=49(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x), r6=202(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=496(x1), r11=213(y1), r12=147(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 144
LDI r2, 49
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 202
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 496
LDI r11, 213
LDI r12, 147
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
