; DESCRIPTION: Composite: Draws a black rectangle at (369, 139) with width 62 and height 43 then Places a white dot at position (136, 116) then Draws a cyan line from (327, 232) to (504, 159).
; PLAN: r0=369(x), r1=139(y), r2=62(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=116(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=327(x1), r11=232(y1), r12=504(x2), r13=159(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 139
LDI r2, 62
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 116
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 232
LDI r12, 504
LDI r13, 159
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
