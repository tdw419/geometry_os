; DESCRIPTION: Composite: Creates a blue circular shape at (123, 118) with radius 62 then Places a yellow dot at position (483, 89) then Draws a green rectangle at (179, 36) with width 89 and height 51.
; PLAN: r0=123(x), r1=118(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=89(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=179(x), r11=36(y), r12=89(width), r13=51(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 118
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 89
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 179
LDI r11, 36
LDI r12, 89
LDI r13, 51
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
